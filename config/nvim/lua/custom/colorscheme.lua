local M = {}
local config = require('config')
local palette = require('night.core').get_colors()
local hi = vim.highlight.create

function M.init ()
  if config.colorscheme == 'night' then
    if config.plugins.specify.night.nvim_tree.contrast == false then
      hi('NvimTreeVertSplit', { guifg = palette.background }, false)
    end
  end
end

return M
