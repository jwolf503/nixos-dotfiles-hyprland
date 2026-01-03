{
  pkgs,
  nvf,
  ...
}: let
  maximalNvim = nvf.packages.${pkgs.system}.maximal;
in {
  home.packages = [
    maximalNvim
  ];
  xdg.configFile."nvim/after/plugin/spell.maximalNvim".text = ''
    set spell
    set spelllang=en
  '';
}
