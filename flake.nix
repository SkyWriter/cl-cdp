{
  description = "Flake for Box2D and c2ffi development shell";

  inputs = {
    nixpkgs.url = "path:/nix/var/nix/profiles/per-user/root/channels/nixos";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default =
          let
            libs = [
              pkgs.openssl
            ];
          in
          pkgs.mkShell {
            buildInputs = [
              pkgs.chromedriver
              pkgs.cmake
              pkgs.google-chrome
              pkgs.clang
              pkgs.pkg-config
            ]
            ++ libs;
            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
          };
      }
    );
}
