" -- custom ident line plugin
lua << EOF
require("indent_blankline").setup {
  show_current_context = false,
  show_current_context_start = false,
}
EOF

lua << EOF
local home = os.getenv("HOME")
local db = require("dashboard")
local helpers = require("better-vim.helpers")

db.custom_footer = {"", " " .. vim.fn.getcwd():gsub(home, "") .. ""}
db.custom_header = {}
db.header_pad = 4
db.custom_center = {
     {
        icon = "  ",
        desc = "Open explorer                     ",
        action = "NvimTreeToggle",
        shortcut = "ctrl+n"
    },
    {
        icon = "  ",
        desc = "Find file                         ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = "ctrl+p"
    },
    {
        icon = "  ",
        desc = "Search                            ",
        action = "Telescope live_grep",
        shortcut = "ctrl+f"
    },

  }
EOF
