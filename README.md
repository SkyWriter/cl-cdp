# cl-cdp

A Common Lisp client for the [Chrome DevTools Protocol (CDP)](https://chromedevtools.github.io/devtools-protocol/),
auto-generated from the official protocol specification.

## Status

Early / alpha. The runtime + generated bindings are complete; the WebSocket
transport layer has one external dependency (`websocket-driver` or equivalent)
that you choose at load-time.

## Features

- **All 54 CDP domains** covered: `Page`, `Network`, `DOM`, `Runtime`, `CSS`, `Debugger`, …
- **Auto-generated** from the official `browser_protocol.json` / `js_protocol.json` — re-run
  the generator whenever Chrome ships new protocol versions
- **Sync and async** command sending
- **Event system** with `add-event-handler`, `wait-for-event`, `collecting-events`
- Idiomatic Lisp names: `Page.navigate` → `cdp/page:navigate`, `requestWillBeSent` → `:request-will-be-sent`
- Deprecated / experimental commands preserved but annotated

## Quick start

```
google-chrome --remote-debugging-port=9222 --headless=new
```

```lisp
(push #p".../cl-cdp/" ql:*local-project-directories*)

(ql:quickload :cl-cdp)

;; Find the first open page target
(defvar *targets* (cdp:list-targets "localhost" 9222))
(defvar *ws-url* (getf (first *targets*) :web-socket-debugger-url))

;; Open a connection
(defvar *conn* (cdp:connect *ws-url*))

;; Navigate
(cdp/page:enable :connection *conn*)
(cdp/page:navigate :url "https://example.com" :connection *conn*)

;; Wait for load
(cdp:wait-for-event *conn* "Page.loadEventFired" :timeout 10)

;; Evaluate JavaScript
(cdp/runtime:evaluate :expression "document.title"
                      :return-by-value t
                      :connection *conn*)
;; => (:result (:type "string" :value "Example Domain") ...)

;; Listen to network requests
(cdp/network:enable :connection *conn*)
(cdp:add-event-handler *conn* "Network.requestWillBeSent"
  (lambda (params)
    (format t "~a ~a~%"
            (getf (getf params :request) :method)
            (getf (getf params :request) :url))))

;; Clean up
(cdp:disconnect *conn*)
```

## High-level API

For common tasks there is a convenience layer in `src/cl-cdp/sugar.lisp` that
handles connection setup and teardown for you.

### `with-browser-tab`

Connects to the first available page target, enables `Page` and `Runtime` by
default, runs the body, then disconnects. `*connection*` is bound inside the
body so all domain functions work without an explicit `:connection` argument.

```lisp
(cdp:with-browser-tab (conn)
  (cdp:navigate "https://example.com")
  (cdp:page-title))
;; => "Example Domain"
```

Additional domains can be enabled via `:enable`:

```lisp
(cdp:with-browser-tab (conn :enable '(cdp/network:enable))
  (cdp:collecting-events (conn "Network.requestWillBeSent" reqs)
    (cdp:navigate "https://example.com"))
  (length reqs))
```

Host and port can be overridden:

```lisp
(cdp:with-browser-tab (conn :host "192.168.1.10" :port 9333)
  (cdp:navigate "https://example.com")
  (cdp:page-url))
```

### Convenience functions

All of these use `*connection*` implicitly and are intended for use inside
`with-browser-tab`.

| Function | Description |
|---|---|
| `(cdp:navigate url &key (timeout 30))` | Navigate and wait for `Page.loadEventFired` |
| `(cdp:evaluate expression &key return-by-value await)` | Evaluate JavaScript |
| `(cdp:screenshot &key format quality full-page)` | Capture screenshot, returns usb8-array |
| `(cdp:page-title)` | Return current page title |
| `(cdp:page-url)` | Return current page URL |

### Screenshot example

```lisp
(cdp:with-browser-tab (conn)
  (cdp:navigate "https://example.com")
  (let ((bytes (cdp:screenshot :format "png" :full-page t)))
    (with-open-file (f "/tmp/shot.png" :direction :output
                                       :element-type '(unsigned-byte 8)
                                       :if-exists :supersede)
      (write-sequence bytes f))))
```

## How it works

### Protocol → Lisp naming

| CDP                          | Lisp                                    |
|------------------------------|-----------------------------------------|
| `Page.navigate`              | `(cdp/page:navigate :url "...")`        |
| `Network.requestWillBeSent`  | event method string `"Network.requestWillBeSent"` |
| `DOM.getDocument`            | `(cdp/dom:get-document :depth 1)`       |
| `Runtime.evaluate`           | `(cdp/runtime:evaluate :expression "…")` |

- Each CDP domain gets its own package: `cdp/page`, `cdp/network`, `cdp/dom`, etc.
- Commands become functions with keyword arguments matching their parameters.
- Optional parameters default to `nil` and are omitted from the JSON payload.
- Results are returned as keyword plists: `(:frame-id "…" :loader-id "…")`.
- Events get a constant `+event-name+` and an `on-event-name` helper per domain.

### Connection model

```
Chrome  ←── WebSocket (JSON) ───→  cl-cdp
```

`cdp:connect ws-url` returns a `connection` object. Pass it explicitly or bind
`cdp:*connection*` for convenience. `cdp:send-command` is synchronous (blocks on
a condition variable); `cdp:send-command-async` takes a callback.

## Regenerating the bindings

When Chrome ships new protocol versions:

```bash
# Update the spec
cd vendor/devtools-protocol && git pull

# Regenerate
python3 codegen/generate.py
```

The generator reads the JSON specs and emits one `.lisp` file per domain. The
generated files contain only calls to three macros (`define-domain-command`,
`define-domain-event`, `define-domain-type`) — all logic lives in `src/`.

## Project structure

```
cl-cdp/
├── cl-cdp.asd      # ASDF system definition
├── src/cl-cdp/
│   ├── package.lisp            # Package declarations
│   ├── utils.lisp              # Naming + JSON helpers
│   ├── connection.lisp         # WebSocket connection, send-command, dispatch
│   ├── protocol.lisp           # define-domain-* macros (used by generated/)
│   ├── events.lisp             # wait-for-event, collecting-events
│   └── sugar.lisp              # High-level convenience layer
├── generated/                  # ← auto-generated, one file per CDP domain
│   ├── page.lisp
│   ├── network.lisp
│   ├── runtime.lisp
│   └── ...
├── codegen/
│   └── generate.py             # The generator
├── vendor/devtools-protocol/
│   └── json/                   # Spec snapshots (browser + js protocol)
└── examples/
    └── basic-usage.lisp
```

## Dependencies

| Library             | Purpose                              |
|---------------------|--------------------------------------|
| `websocket-driver`  | WebSocket client                     |
| `yason`             | JSON encode / decode                 |
| `bordeaux-threads`  | Condition variables for sync wait    |
| `dexador`           | HTTP requests for target discovery   |
| `cl-ppcre`          | Regex for camelCase→lisp-name        |
| `split-sequence`    | String splitting                     |
| `cl-base64`         | Screenshot decoding                  |

All available via [Quicklisp](https://www.quicklisp.org/).

## Contributing

PRs welcome. The main areas where help would be valuable:

- **Type checking** — use `define-domain-type` enums to validate inputs
- **Test suite** — integration tests against a real headless Chrome
- **Quicklisp submission** — once stable

## License

Copyright (C) 2026 Ivan Kasatenko

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <https://www.gnu.org/licenses/>.

The bundled CDP protocol JSON files are BSD-3-Clause (Google / Chromium Authors).
