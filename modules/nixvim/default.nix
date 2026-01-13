{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    globals.mapleader = " ";

    opts = {
      #general settings
      clipboard = "unnamedplus";
      mouse = "a";
      splitbelow = true;
      splitright = true;
      timeoutlen = 500;
      termguicolors = true;
      completeopt = "menuone,noselect";
      updatetime = 300;

      #tab settings
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      shiftround = true;
      autoindent = true;
      smartindent = true;

      #linenumbers
      number = true;
      relativenumber = true;
      wrap = false;
      cursorline = true;
      signcolumn = "yes";
      scrolloff = 8;
      sidescrolloff = 5;

      #search
      ignorecase = true;
      smartcase = true;
      incsearch = true;
      hlsearch = true;

      #swap
      swapfile = false;
      backup = false;
      writebackup = false;
      undofile = true;

      # text stuff
      list = true;
      listchars = {
        tab = "→ ";
        trail = "°";
        extends = "›";
        precedes = "‹";
      };

      #fold your laundry
      foldmethod = "indent";
      foldlevel = 99;
      foldenable = false;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>q";
        action = ":q<CR>";
        options.silent = false;
      }

 #telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<CR>";
        options.silent = true;
      }

      #gitsigns
      {
        mode = "n";
        key = "<leader>lp";
        action = "<cmd>lua require('gitsigns').preview_hunk()<CR>";
        options.silent = true;
      }

      #lazygit
      {
        mode = "n";
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options.silent = true;
      }
    ];
   };
}



