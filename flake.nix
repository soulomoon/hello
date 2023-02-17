{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {
    packages.aarch64-darwin.hello =
          let pkgs = import nixpkgs {
            system = "aarch64-darwin";
          };
          in pkgs.stdenv.mkDerivation {
              pname = "hello-repeater";
              version = "1.0.0";
              src = pkgs.fetchgit {
                url = "https://github.com/soulomoon/hello.git";
                # rev = "c++-code-alone";
                sha256 = "sha256-oT6HLkccIfhMX4b0Hk85NHD/WONnrq6OYpKuDsa63aY=";
              };
              installPhase = ''
                mkdir -p $out/bin
                cp hello_cmake $out/bin
              '';

              nativeBuildInputs = [
                pkgs.cmake
              ];
            };

    packages.aarch64-darwin.default = self.packages.aarch64-darwin.hello;

  };
}
