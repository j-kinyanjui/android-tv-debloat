{ pkgs, ... }:
{

  packages = [ pkgs.android-tools ];

  enterShell = ''
    adb --version
  '';

  scripts.debloat = {
    exec = scripts/adb_remove.sh;
    description = "debloat android tv";
  };
}
