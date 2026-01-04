{
  pkgs,
  nvf,
  ...
}: 
let
  maximalNvim = nvf.packages.${pkgs.system}.maximal;
in {

  home.packages = [
    maximalNvim
  ];

  xdg.configFile."nvim/after/plugin/spell-local.vim".text = ''
    autocmd BufRead,BufNewFile * setlocal spell spellfile=~/.local/share/nvim/spell/programming.utf-8.add
  '';
}
