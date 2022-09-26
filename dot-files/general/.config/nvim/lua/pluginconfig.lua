local servers = {'clangd'}

--| nvim-lspconfig defaults |--
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

--| setup for nvim-lspconfig servers |--
require'lspconfig'.bashls.setup{}

require("clangd_extensions").setup {
  server = {
    on_attach = on_attach,
    flags = lsp_flags,
        -- options to pass to nvim-lspconfig
        -- i.e. the arguments to require("lspconfig").clangd.setup({})
    },
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 100,
        },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },

            highlights = {
                detail = "Comment",
            },
        },
        memory_usage = {
            border = "none",
        },
        symbol_info = {
            border = "none",
        },
    },
                                   }
--require('lspconfig')['pyright'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--}
--require('lspconfig')['tsserver'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--}
--require('lspconfig')['rust_analyzer'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
    -- Server-specific settings...
--    settings = {
--      ["rust-analyzer"] = {}
--    }
--}
--require'lspconfig'.clangd.setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--                               }

--| Treesitter settings --|
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "bash" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
  }
                                       }
--| Coq Settings |--
vim.g.coq_settings = {auto_start = 'shut-up'}


require'colorizer'.setup()


--| Dashboard Settings |--
local home = os.getenv('HOME')
local db = require('dashboard')
-- macos
--  db.preview_command = 'cat | lolcat -F 0.3'
db.preview_command = 'neofetch -l & sleep 100'
--
--db.preview_command = 'cat'
-- linux
--db.preview_command = 'ueberzug'

--db.preview_file_path = home .. '/.config/nvim/static/Gentoo-neofetch.png'
db.preview_file_path = ' '

db.custom_header = {
'',
'         -/oyddmdhs+:.             ',
'     -odNMMMMMMMMNNmhy+-`          ',
'   -yNMMMMMMMMMMMNNNmmdhy+-        ',
' `omMMMMMMMMMMMMNmdmmmmddhhy/`     ',
' omMMMMMMMMMMMNhhyyyohmdddhhhdo`   ',
'.ydMMMMMMMMMMdhs++so/smdddhhhhdm+` ',
' oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.',
'  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh',
'    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy',
'       /mMMMMMMNNNmmmdddhhhhhmMNhs:',
'    `oNMMMMMMMNNNmmmddddhhdmMNhs+` ',
'  `sNMMMMMMMMNNNmmmdddddmNMmhs/.   ',
' /NMMMMMMMMNNNNmmmdddmNMNdso:`     ',
'+MMMMMMMNNNNNmmmmdmNMNdso/-        ',
'yMMNNNNNNNmmmmmNNMmhs+/-`          ',
'/hMMNNNNNNNNMNdhs++/-`             ',
'`/ohdmmddhys+++/:.`                ',
'  `-//////:--.                     ',
'',

}


db.preview_file_height = 20
db.preview_file_width = 35
db.custom_center = {
      {icon = '  ',
      desc = 'Recent sessions                         ',
      shortcut = 'SPC s l',
      action ='Telescope possession list'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'lua require(\'memento\').toggle()',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Neovim config                           ',
      action = 'Telescope file_browser path=' .. home ..'/.config/nvim',
      shortcut = 'SPC f d'},
    }

--| Momento configuration |--
vim.g.memento_history = 20

--|Possession Settings |--
require('possession').setup {
        autosave = {
        current = true,  -- or fun(name): boolean
        tmp = true,  -- or fun(): boolean
        tmp_name = 'tmp',
        on_load = true,
        on_quit = true,
    },

}


--| Telescope Extensions |--
require("telescope").load_extension "file_browser"
require('telescope').load_extension('possession')

require('neoscroll').setup()

--| Instant Configuration |--
vim.g.instant_username = "ki11errabbit"


--| Gitsigns |--
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

--| which-key |--
require("which-key").setup{}
