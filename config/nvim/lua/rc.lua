local config = {}
local consts = require('consts')

config.colorscheme = 'night'

config.lualine = {
  theme = 'night-nvim'
}

config.general = {
  -- configure normal neovim in lua format!
  -- you can add ALL neovim options, the general variables loader
  -- will call neovim to setup it!
  opt = {
    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    smartindent = false,
    autoindent = true,

    number = true,
    cursorline = false,

    mouse = 'a',
    clipboard = 'unnamedplus',

    wrap = false,
    showmode = false,

    termguicolors = true,

    guicursor = 'i:hor10',
  },
  g = {
    mapleader = ' ',
  },
  o = {
    background = 'dark'
  }
}

config.tabbar = {
  backend = 'bufferline', -- lualine | bufferline | none: none to don't load tabbar
  options = {}, -- the options for the backend
}

config.plugins = {
  -- with this you can add more plugins into your private config
  -- write your plugins like the packer `use` function parameter
  -- e.g:
  -- {'navarasu/onedark.nvim', as = 'onedark'}
  additional_plugins = {
    'elkowar/yuck.vim',
    'lukas-reineke/indent-blankline.nvim',
    'andweeb/presence.nvim'
  },
  to_enable = {
    icons = {},
    nvim_tree = { has_mappings = true, has_autocmds = true },
    telescope = { has_mappings = true },
    bufferline = {},
    lualine = {},
    treesitter = {},
    colorizer = {},
    autopairs = {},
    cmp = {},
    lspinstaller = {},
    lspcolors = {},
    cosmic_ui = {},
    notify = {},
    toggleterm = {},
  },
  specify = {
    rosepine = {
      tree_contrast = true,
    },
    night = {
      nvim_tree = {
        contrast = false,
      },
    },
    aquarium = {
      tree_contrast = true,
      style = 'dark',
    },
    everblush = {
      tree_contrast = true,
      borders = false,
    },
    everforest = {
      italic = true,
      italic_comment = false,
      tree_contrast = true
    },
    gruvbox = {
      tree_contrast = true,
      telescope_integration = true,
      borders = true,
    },
    catppuccin = {
      tree_contrast = true,
    },
    tokyonight = {
      custom_folder_icons = true,
      tree_contrast = true,
      style = 'night',
      italics = {
        comments = true,
        keywords = false,
        variables = false,
        functions = false
      },
    },
    material = {
      style = 'deep ocean',
      options = {},
    },
    onedark = {
      -- custom_opts: override configuration for base onedark plugin, see: https://github.com/monsonjeremy/onedark.nvim
      custom_opts = {},
      darker = true,
      telescope_integration = true,
      tree_contrast = true,
      custom_folder_icons = true
    },
    notify = {
      options = {
        -- in this table you can override the default configuration settings for
        -- nvim notify, see `lua/plugconfigs/notify.lua`
      },
    },
    nvim_tree = {
      open_at_startup = false,
      hide_statusline = true
    },
    treesitter = {
      ensure_installed = {
        'lua',
        'vim',
        'javascript',
        'cpp',
      },
      sync_installed = true,
    },
  },
}

config.lsp = {
  misc = {
    signature = true,
    cosmic_ui = {
      rename = true,
      code_actions = true,
    },
  },
  servers = {
    html = consts.NIL,
    cssls = consts.NIL,
    -- tsserver = consts.NIL,
    pylsp = consts.NIL,
    volar = consts.NIL,
    -- vuels = consts.NIL,
    clangd = consts.NIL,
    emmet_ls = consts.NIL,
    sumneko_lua = function()
      local runtime_path = vim.split(package.path, ';')
      table.insert(runtime_path, 'lua/?.lua')
      table.insert(runtime_path, 'lua/?/init.lua')

      return {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = runtime_path,
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          }
        }
      }
    end
  },
}

config.custom = {
  load = {
    autocmds = true,
    mappings = true,
    colorscheme = true
  },
}

return config

