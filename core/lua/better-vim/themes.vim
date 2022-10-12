lua << EOF
local catppuccin = require("catppuccin")
local config = require("better-vim")
local helpers = require("better-vim.helpers")
local themeName = helpers.get_config_item {"theme", "name"}

-- Setting catppuccin color
if  themeName == "catppuccin" then 
  require("catppuccin").setup({
    transparent_background = false,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {},
    color_overrides = {},
    highlight_overrides = {},
  })
  vim.g.catppuccin_flavour =  helpers.get_config_item {"theme", "catppuccin_flavour"}
end

if  themeName == "ayu" then 
  vim.cmd('let ayucolor = "' .. helpers.get_config_item {"theme", "ayucolor"} .. '"')
end

vim.cmd("colorscheme " .. helpers.get_config_item {"theme", "name"} )
EOF
