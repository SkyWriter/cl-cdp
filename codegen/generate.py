import json, re
from pathlib import Path

SPEC_DIR = Path("vendor/devtools-protocol/json")
OUT_DIR  = Path("generated")

# CL symbols that CDP commands/events clash with
CL_CLASHES = {"close", "enable", "disable", "read", "log", "error",
              "continue", "abort", "load", "compile", "eval", "open",
              "write", "delete", "search", "find", "map", "sort",
              "count", "merge", "replace", "values", "sleep", "signal",
              "get", "set", "list", "type", "format", "print", "not",
              "and", "or", "reset", "handler", "restart", "get-properties"}

for f in OUT_DIR.glob("*.lisp"):
    f.unlink()

def camel_to_lisp(s):
    s2 = re.sub(r'([a-z0-9])([A-Z])', r'\1-\2', s)
    s2 = re.sub(r'([A-Z]+)([A-Z][a-z])', r'\1-\2', s2)
    return s2.lower()

def domain_pkg(d): return "cdp/" + camel_to_lisp(d)
def local_sym(name): return camel_to_lisp(name)

def cdp_type_kw(type_str, ref):
    if ref: return ":ref"
    mapping = {"string":"string","integer":"integer","number":"number",
               "boolean":"boolean","array":"array","object":"object","any":"any"}
    return ":" + mapping.get(type_str or '', 'unknown')

def lisp_str(s):
    return s.replace('\\', '\\\\').replace('"', '\\"').replace('\n', ' ')

def ref_val(ref):
    return '"' + ref + '"' if ref else "nil"

def emit_items(items):
    if not items: return "nil"
    iref = items.get("$ref"); itype = items.get("type")
    return "(:type " + cdp_type_kw(itype, iref) + " :ref " + ref_val(iref) + ")"

def emit_param_list(params):
    if not params: return "nil"
    lines = []
    for p in params:
        name = camel_to_lisp(p.get("name",""))
        ref  = p.get("$ref"); tstr = p.get("type")
        opt  = p.get("optional", False)
        desc = lisp_str(p.get("description",""))
        lines.append("        (:name :" + name
                + " :type " + cdp_type_kw(tstr, ref)
                + " :ref " + ref_val(ref)
                + " :items " + emit_items(p.get("items"))
                + " :optional " + ("t" if opt else "nil")
                + ' :doc "' + desc + '")')
    return "(\n" + "\n".join(lines) + ")"

def emit_enum(enums):
    if not enums: return "nil"
    return "'(" + " ".join('"' + e + '"' for e in enums) + ")"

def collect_shadows(domain):
    """Find all command/event names in this domain that clash with CL."""
    shadows = set()
    for cmd in domain.get("commands", []) + domain.get("events", []):
        name = camel_to_lisp(cmd["name"])
        if name in CL_CLASHES:
            shadows.add(name)
    return sorted(shadows)

def write_domain(domain, spec_date):
    dname = domain["domain"]
    pkg   = domain_pkg(dname)
    fname = OUT_DIR / (camel_to_lisp(dname) + ".lisp")
    shadows = collect_shadows(domain)

    with open(fname, "w") as f:
        f.write(";;;; " + dname + " CDP domain"
                + (" [EXPERIMENTAL]" if domain.get("experimental") else "") + "\n")
        f.write(";;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.\n")
        f.write(";;;; Spec version: " + str(spec_date) + "\n\n")
        f.write("(defpackage #:" + pkg + "\n")
        f.write("  (:use #:cl)\n")
        if shadows:
            f.write("  (:shadow\n")
            for i, s in enumerate(shadows):
                comma = "" if i == len(shadows)-1 else ""
                f.write("    #:" + s + "\n")
            f.write("  )\n")
        f.write("  (:import-from #:cdp #:*connection*)\n")
        f.write("  (:import-from #:cdp/impl\n")
        f.write("    #:define-domain-command\n")
        f.write("    #:define-domain-event\n")
        f.write("    #:define-domain-type))\n\n")
        f.write("(in-package #:" + pkg + ")\n\n")

        for t in domain.get("types", []):
            tid   = t.get("id","")
            desc  = lisp_str(t.get("description",""))
            exp   = "t" if t.get("experimental") else "nil"
            dep   = "t" if t.get("deprecated") else "nil"
            props = emit_param_list(t.get("properties",[]))
            enums = emit_enum(t.get("enum"))
            ttype = t.get("type","object")
            f.write("(define-domain-type " + local_sym(tid) + "\n")
            f.write('  :cdp-id "' + tid + '" :type :' + ttype + "\n")
            f.write("  :properties " + props + "\n")
            f.write("  :enum " + enums + "\n")
            f.write('  :doc "' + desc + '" :experimental ' + exp + " :deprecated " + dep + ")\n\n")

        for cmd in domain.get("commands", []):
            sym    = local_sym(cmd["name"])
            method = dname + "." + cmd["name"]
            desc   = lisp_str(cmd.get("description",""))
            exp    = "t" if cmd.get("experimental") else "nil"
            dep    = "t" if cmd.get("deprecated") else "nil"
            params = emit_param_list(cmd.get("parameters",[]))
            rets   = emit_param_list(cmd.get("returns",[]))
            f.write("(define-domain-command " + sym + "\n")
            f.write('  :method "' + method + '"\n')
            f.write("  :params " + params + "\n")
            f.write("  :returns " + rets + "\n")
            f.write('  :doc "' + desc + '" :experimental ' + exp + " :deprecated " + dep + ")\n\n")

        for evt in domain.get("events", []):
            sym    = local_sym(evt["name"])
            method = dname + "." + evt["name"]
            desc   = lisp_str(evt.get("description",""))
            exp    = "t" if evt.get("experimental") else "nil"
            dep    = "t" if evt.get("deprecated") else "nil"
            params = emit_param_list(evt.get("parameters",[]))
            f.write("(define-domain-event " + sym + "\n")
            f.write('  :method "' + method + '"\n')
            f.write("  :params " + params + "\n")
            f.write('  :doc "' + desc + '" :experimental ' + exp + " :deprecated " + dep + ")\n\n")

    return camel_to_lisp(dname)

all_names = []
for spec_file in [SPEC_DIR/"browser_protocol.json", SPEC_DIR/"js_protocol.json"]:
    data = json.loads(spec_file.read_text())
    ver  = data.get("version",{}).get("major","tot")
    for domain in data["domains"]:
        all_names.append(write_domain(domain, ver))

print("Done:", len(all_names), "files")
