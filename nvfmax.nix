{ pkgs, nvf, ... }:

let
  customNeovim = nvf.lib.neovimConfiguration {
    inherit pkgs;

    modules = [
      nvf.modules.maximal

      # Add any extra customizations here
      {
        config.vim.theme.enable = true;
      }
    ];
  };
in
{
  # Install the custom Neovim into the user's environment permanently
  home.packages = [
    customNeovim.neovim
  ];
}
