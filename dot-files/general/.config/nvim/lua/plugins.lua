

return require('packer').startup(function(use)

     use 'wbthomason/packer.nvim'

     use 'lambdalisue/suda.vim'

     use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
         }

     --use {'rrethy/vim-hexokinase', run = 'make hexokinase', setup = [[]]}

     use 'vimwiki/vimwiki'

     --use {'neoclide/coc.nvim', branch = 'release'}

     use {'sakhnik/nvim-gdb', run = 'bash ./install.sh' }

     use 'jackguo380/vim-lsp-cxx-highlight'

     --use 'https://github.com/psliwka/vim-smoothie'

     --use { 'autozimu/LanguageClient-neovim', branch = 'next',run = 'bash install.sh' }

     use 'neovim/nvim-lspconfig'

     use 'p00f/clangd_extensions.nvim'

     use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

     use { 'michaelb/sniprun', run = 'bash ./install.sh'}

     use 'rcarriga/nvim-notify'

     use { 'ms-jpq/coq_nvim', branch = 'coq' }

     use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

     use 'kyazdani42/nvim-web-devicons'

   --  use 'glepnir/indent-guides.nvim'

     use {'glepnir/dashboard-nvim'}
     --  use { 'settings/keybinds.lua' }

     use {
       'nvim-telescope/telescope.nvim', tag = '0.1.0',
       -- or                            , branch = '0.1.x',
       requires = { {'nvim-lua/plenary.nvim'} }
         }   --  use { 'settings/plugins.lua' }

     use 'nvim-lua/plenary.nvim'

     use 'NvChad/nvim-colorizer.lua'

     use { "nvim-telescope/telescope-file-browser.nvim" }

     use 'gaborvecsei/memento.nvim'

     use {
       'jedrzejboczar/possession.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
         }

     use 'karb94/neoscroll.nvim'

     use 'jbyuki/instant.nvim'

     use({
    	'NTBBloodbath/doom-one.nvim',
    	config = function()
        require('doom-one').setup({
            cursor_coloring = false,
            terminal_colors = false,
            italic_comments = false,
            enable_treesitter = true,
            transparent_background = false,
            pumblend = {
                enable = true,
                transparency_amount = 20,
            },
            plugins_integrations = {
                neorg = true,
                barbar = true,
                bufferline = false,
                gitgutter = false,
                gitsigns = true,
                telescope = false,
                neogit = true,
                nvim_tree = true,
                dashboard = true,
                startify = true,
                whichkey = true,
                indent_blankline = true,
                vim_illuminate = true,
                lspsaga = false,
            },
        })
      end,
     })


end)
