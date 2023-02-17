{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/cfa78cb43389635df0a9086cb31b74d3c3693935";

  outputs = { self, nixpkgs }: {
    packages.aarch64-darwin.hello =
          let pkgs = import nixpkgs {
            system = "aarch64-darwin";
          };
          in pkgs.stdenv.mkDerivation {
              pname = "hello-repeater";
              version = "1.0.0";
              src = ./.;
              installPhase = ''
                mkdir -p $out/bin
                cp hello_cmake $out/bin/hello-repeater
              '';

              nativeBuildInputs = [
                pkgs.cmake
              ];
            };

    packages.aarch64-darwin.default = self.packages.aarch64-darwin.hello;

  };
}
