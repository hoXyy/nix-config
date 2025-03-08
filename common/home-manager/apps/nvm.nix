{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "nvm";
  version = "0.40.1";
  src = pkgs.fetchFromGitHub {
    owner = "nvm-sh";
    repo = "nvm";
    rev = "v0.40.1";
    sha256 = "sha256-PMeFHjJ3qcphXV8MceZwleOgJrDfEeS3m/ZGvKlWbeg=";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/nvm
    cp -r . $out/share/nvm
  '';
}
