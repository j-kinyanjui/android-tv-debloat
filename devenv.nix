{ ... }:
{

  # packages = [ pkgs.universal-android-debloater ]; no darwin support 🫣

  # https://devenv.sh/languages/
  android.enable = true;

  # https://devenv.sh/basics/
  enterShell = ''
    adb --version
  '';

  scripts.debloat = {
    exec = scripts/adb_remove.sh;
    description = "debloat android tv";
  };
}
