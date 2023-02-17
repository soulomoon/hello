{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/cfa78cb43389635df0a9086cb31b74d3c3693935";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages =
          {
            hello = pkgs.stdenv.mkDerivation {
              pname = "hello-repeater";
              version = "1.0.0";
              # src = pkgs.fetchgit {
              #   url = "https://github.com/soulomoon/hello.git";
              #   # rev = "c++-code-alone";
              #   sha256 = "sha256-oT6HLkccIfhMX4b0Hk85NHD/WONnrq6OYpKuDsa63aY=";
              # };

              src = ./.;
              installPhase = ''
                mkdir -p $out/bin
                cp hello_cmake $out/bin/hello-repeater
              '';

              nativeBuildInputs = [
                pkgs.cmake
              ];
            };
            default = packages.hello;
          };
      }
    );
}
