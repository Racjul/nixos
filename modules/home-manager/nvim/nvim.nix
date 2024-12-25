
{pkgs,lib,config,inputs, ...}:
{
  options = {
    nvim.enable = lib.mkEnableOption "enable nvim tools";
  };
  
  config = lib.mkIf config.nvim.enable{
    nixpkgs = {
      overlays = [
        (final: prev: {
          vimPlugins = prev.vimPlugins // {

            solarized-osaka = prev.vimUtils.buildVimPlugin {
              name = "solarized-osaka";
              src = inputs.solarized-osaka;
            };

            nvim-tree= prev.vimUtils.buildVimPlugin {
              name = "nvim-tree";
              src = inputs.nvim-tree;
            };

            nvim-copilot= prev.vimUtils.buildVimPlugin {
              name = "nvim-copilot";
              src = inputs.nvim-copilot;
            };
  
          };
        })
      ];
    };

    home.file.".config/nvim/snippets" = {
      source = ./snippets;
      recursive = true;
    };

    programs.neovim = 
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = ''
      ${builtins.readFile ./core/options.lua}
      ${builtins.readFile ./core/remaps.lua}
      '';
      
      extraPackages = with pkgs; [

        # Language server
        lua-language-server            
        nil
        emmet-ls
        rocmPackages.llvm.clang-tools-extra
        tailwindcss-language-server
        nodePackages.vscode-html-languageserver-bin
        nodePackages.vscode-css-languageserver-bin
        nodePackages.typescript-language-server
        nodePackages.svelte-language-server
        nodePackages.pyright

        # Text formating 
        nodePackages.prettier
        nodePackages.eslint
        stylua

        #Copy/Paste outside neovim
        xclip
        wl-clipboard

        #For Copilot
        nodejs_21

        #For vimtex
        texlive.combined.scheme-full  
        texliveFull       

      ];

      plugins = with pkgs.vimPlugins; [

        # Telescope dependencies
        telescope-fzf-native-nvim
        plenary-nvim
        nvim-web-devicons

        # Cmp dependencies
        cmp_luasnip 
        cmp-nvim-lsp
        cmp-path
        cmp-buffer
        luasnip
        friendly-snippets
        lspkind-nvim
        copilot-cmp


        # Other
        neodev-nvim
        dressing-nvim
        which-key-nvim 
        vim-nix
        neodev-nvim
        tagbar
        undotree
        vim-fugitive
        vim-be-good
        harpoon
        colorizer

        # Because of broken package
        nvim-treesitter-parsers.typescript
        nvim-treesitter-parsers.java

        # Wich-key plugin to indicate keymaps while using nvim
        {
          plugin = which-key-nvim;
          config = toLua "
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require(\"which-key\").setup {}
          ";
        }

        # Autoclose-nvim to close bracket et parenthese automatically
        {
          plugin = autoclose-nvim;
          config  = toLua "require(\"autoclose\").setup()";
        }

        # Lualine plugin for nice status bar
        {
          plugin = lualine-nvim;
          config = toLuaFile ./plugin/lualine.lua;
        }

        # Nvim-lspconfig plugin for language server setup
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./plugin/lsp.lua;
        }

        # Comment-nvim plugin to comment block of code
        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        # Nvim-cmp for autocompletion
        {
          plugin = nvim-cmp;
          config = toLuaFile ./plugin/cmp.lua;
        }

        # Telescope plugin for file navigation using fuzzy finder
        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugin/telescope.lua;
        }

        # Tree-sitter plugin for syntax highlighting 
        {

          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-cpp
            p.tree-sitter-rust
            p.tree-sitter-javascript
            p.tree-sitter-html
            p.tree-sitter-css
            p.tree-sitter-svelte
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-c
            p.tree-sitter-json
          ]));
          config = toLuaFile ./plugin/treesitter.lua;
        }

        # Best theme
        {
          plugin = solarized-osaka;
          config = toLuaFile ./plugin/solarized-osaka.lua;
        }

        # Nvim-tree for file navigation
        {
          plugin = nvim-tree;
          config = toLuaFile ./plugin/nvim-tree.lua;
        }

        # Gitsigns plugin for git integration
        {
          plugin = gitsigns-nvim;
          config = toLuaFile ./plugin/gitsigns.lua;
        }

        # Copilot plugin for code suggestion
        {
          plugin = nvim-copilot;
          config = toLua"
          require(\"copilot\").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
          })
          ";
        }

        #Vimtex
        {
          plugin = vimtex;
          config = toLuaFile ./plugin/vimtex.lua;
        }

        #Luasnip
        {
          plugin = luasnip;
          config = toLuaFile ./plugin/luasnip.lua;
        }

        # Toggleterm plugin for terminal
        {
          plugin = toggleterm-nvim;
          config = toLua "require('toggleterm').setup{}";
        }

      ];

    };

  };
}
