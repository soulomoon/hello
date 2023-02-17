# { pkgs, stdenv, cmake, ... }:
{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  pname = "hello-repeater";
  version = "1.0.0";
  src = pkgs.fetchgit {
    url = "https://github.com/soulomoon/hello.git";
    # rev = "c++-code-alone";
    sha256 = "sha256-SbOWUPyfJOrZWpYfe9CLGwyCwNfez+szI1zzU1DDkCE=";
  };

  nativeBuildInputs = [
    pkgs.cmake
  ];
}