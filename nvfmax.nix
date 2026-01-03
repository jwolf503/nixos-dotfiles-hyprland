{ pkgs, nvf, ... }:
{
    programs.nvf = {
        enable = true;
        
        modules = [
          #  nvf.modules.maximal
        ];

        vim = {
        theme.enable = true;
        
    };
};
  
}
