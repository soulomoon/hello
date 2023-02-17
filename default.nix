# { pkgs, stdenv, cmake, ... }:
{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  pname = "hello-repeater";
  version = "1.0.0";
  src = pkgs.fetchgit {
    url = "https://github.com/soulomoon/hello.git";
    # rev = "c++-code-alone";
    sha256 = "sha256-efTsJvPru/uOh+ZmQ29T+cx9WIfhTlow/UeOaOpcBbE=";
  };

  nativeBuildInputs = [
    pkgs.cmake
  ];
}