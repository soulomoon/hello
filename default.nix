# { pkgs, stdenv, cmake, ... }:
{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
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
}