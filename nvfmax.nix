{ pkgs, nvf, ... }:

let

  customNeovim = nvf.lib.neovimConfiguration {
    inherit pkgs;

    # Start from the nvf "maximal" preset
    modules = [
      nvf.modules.maximal

      # Your extra config on top of the preset
      {
        config.vim = {
          theme.enable = true;
          # add more overrides/custom options here...
        };
      }
    ];
  };
in {
  config = {
    # expose the resulting Neovim via Home-Manager
    home.packages = [ 
        customNeovim.neovim 
    ];
  };
}
