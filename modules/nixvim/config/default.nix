{ pkgs, ...}:

{
    
  imports = [
      ./bufferline.nix 
  ];

  programs.nixvim = {
      enable = true;
      colorschemes = {
          gruvbox = {
              enable = true;
          };
      };
    

  plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;
    
  };

  extraPlugins = with pkgs.vimPlugins; [
      indent-blankline-nvim
  ];
 };
}
