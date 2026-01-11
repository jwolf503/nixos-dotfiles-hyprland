{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      ".." = "cd ..";
      vim = "vim -S ~/.vim/vimrc";
      gvim = "gvim -S ~/.vim/vimrc";
      g = "gvim -S ~/.vim/vimrc";
      ncf = "cd ~/nixos-dotfiles";
      nhs = "home-manager switch --flake ~/nixos-dotfiles";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-jay";
      nfu = "cd ~/nixos-dotfiles && sudo nix flake update";
      fonts = "sh -C ~/.nix-fontlst.sh";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \$ '
      nitch
      export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
      eval "$(zoxide init bash)"
    '';
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      ".." = "cd ..";
      vim = "vim -S ~/.vim/vimrc";
      gvim = "gvim -S ~/.vim/vimrc";
      g = "gvim -S ~/.vim/vimrc";
      ncf = "cd ~/nixos-dotfiles";
      nhs = "home-manager switch --flake ~/nixos-dotfiles";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-jay";
      nfu = "cd ~/nixos-dotfiles && sudo nix flake update";
    };
    interactiveShellInit = ''
      zoxide init fish | source
      nitch
    '';
  };

  # Xonsh config via rc.d (works on any version)
  xdg.configFile."xonsh/rc.d/20-zoxide.xsh".text = ''
    # Aliases
    aliases.update({
        "ll": "ls -l",
        "la": "ls -la",
        "..": "cd ..",
        "vim": "vim -S ~/.vim/vimrc",
        "gvim": "gvim -S ~/.vim/vimrc",
        "g": "gvim -S ~/.vim/vimrc",
        "ncf": "cd ~/nixos-dotfiles",
        "nhs": "home-manager switch --flake ~/nixos-dotfiles",
        "nrs": "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-jay",
        "nfu": "cd ~/nixos-dotfiles && sudo nix flake update",
        "fonts": "sh -C ~/.nix-fontlst.sh"
    })

    # Zoxide init
    execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')
    # nitch prompt
    nitch
  '';
}
