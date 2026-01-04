{ config, pkgs, ... }:
let
  myAliases = {
      ll = "ls -l";
      la = "ls -la";
      ".." = "cd ..";
      vim = "vim -S ~/.vim/vimrc";
      gvim = "gvim -S ~/.vim/vimrc";
      ncf = "cd ~/nixos-dotfiles";
      nhs = "home-manager switch --flake ~/nixos-dotfiles";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-jay";
      nfu = "cd ~/nixos-dotfiles && sudo nix flake update";
 };
in
{
  programs.bash = {
    enable = true;

    shellAliases = myAliases;

    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
      nitch
      export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
    '';
  };
}
