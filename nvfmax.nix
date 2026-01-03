{ pkgs, nvf, ... }:
{
    programs.nvf = {
        enable = true;
        
        modules = [
            nvf.modules.maximal
        ];

        extraConfig = {
            vim .theme.enable = true;
        };
    };
}
