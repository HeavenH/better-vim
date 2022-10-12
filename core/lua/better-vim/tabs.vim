lua << EOF
local helpers = require("better-vim.helpers")

-- Adding mappings to bufferline
tab = 0
repeat
  vim.cmd('nnoremap <silent><M-' .. tab .. '> <cmd>lua require("bufferline").go_to_buffer(' .. tab .. ', true)<cr>')
  tab = tab + 1
until(tab == 20)

if not helpers.get_config_item { "flags", "disable_tabs" } then
  require("bufferline").setup{
    highlights = {
        buffer_selected = {
          italic = false,
        },
      },
    options = {
      show_close_icon = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = " Explorer",
          highlight = "NvimTreeNormal",
          text_align = "left"
        }
      }
    }
  }
end

EOF

