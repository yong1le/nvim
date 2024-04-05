-- Setting the leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- GUI related stuff
vim.opt.guifont = "IosevkaTerm Nerd Font Mono:h16"
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_padding_top = 20
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 10
vim.g.neovide_padding_left = 10
vim.g.neovide_hide_mouse_when_typing = true


vim.g.colors_name = "catppuccin"

-- Editor options
vim.opt.fillchars = {eob = " "}
vim.opt.swapfile = false
vim.opt.breakindent = true                                     -- Wrap indent to match line start
vim.opt.clipboard = "unnamedplus"                              -- Connection to the system clipboard
vim.opt.cmdheight = 1                                          -- hide command line unless needed
vim.opt.completeopt = { "menu", "menuone", "noselect" }        -- Options for insert mode completion
vim.opt.copyindent = false                                     -- Copy the previous indentation on autoindenting
vim.opt.cursorline = true                                      -- Highlight the current line
vim.opt.expandtab = true                                       -- Enable the use of space in tab
vim.opt.fileencoding = "utf-8"                                 -- File content encoding for the buffer
vim.opt.foldenable = true                                      -- enable fold for nvim-ufo
vim.opt.foldlevel = 99                                         -- set high foldlevel for nvim-ufo
vim.opt.foldlevelstart = 99                                    -- start with all code unfolded
vim.opt.foldcolumn = "1"                                         -- show foldcolumn in nvim 0.9
vim.opt.history = 100                                          -- Number of commands to remember in a history table
vim.opt.ignorecase = true                                      -- Case insensitive searching
vim.opt.infercase = true                                       -- Infer cases in keyword completion
vim.opt.laststatus = 3                                         -- globalstatus
vim.opt.linebreak = true                                       -- Wrap lines at 'breakat'
vim.opt.mouse = "a"                                            -- Enable mouse support
vim.opt.number = true                                          -- Show numberline
vim.opt.preserveindent = true                                  -- Preserve indent structure as much as possible
vim.opt.pumheight = 10                                         -- Height of the pop up menu
vim.opt.relativenumber = true                                  -- Show relative numberline
vim.opt.scrolloff = 8                                          -- Number of lines to keep above and below the cursor
vim.opt.shiftwidth = 2                                         -- Number of space inserted for indentation
vim.opt.showmode = false                                       -- Disable showing modes in command line
vim.opt.showtabline = 0                                        -- always display tabline
vim.opt.sidescrolloff = 8                                      -- Number of columns to keep at the sides of the cursor
vim.opt.signcolumn = "yes"                                     -- Always show the sign column
vim.opt.smartcase = true                                       -- Case sensitivie searching
vim.opt.smartindent = true                                     -- Smarter autoindentation
vim.opt.splitbelow = true                                      -- Splitting a new window below the current one
vim.opt.splitright = true                                      -- Splitting a new window at the right of the current one
vim.opt.tabstop = 2                                            -- Number of space in a tab
vim.opt.termguicolors = true                                   -- Enable 24-bit RGB color in the TUI
vim.opt.timeoutlen = 300                                       -- Shorten key timeout length a little bit for which-key
vim.opt.undofile = true                                        -- Enable persistent undo
vim.opt.updatetime = 300                                       -- Length of time to wait before triggering the plugin
vim.opt.virtualedit = "block"                                  -- allow going past end of line in visual block mode
vim.opt.wrap = false                                           -- Disable wrapping of lines longer than the width of window
vim.opt.writebackup = false                                    -- Disable making a backup before overwriting a file
vim.opt.spell = false                                          -- spelling
vim.opt.colorcolumn = "79"
vim.opt.list = true                                            -- show whitespaces characters
vim.opt.showbreak = "↪ "                                     -- show line breaks
vim.opt.listchars = {
  tab = "  ",
  extends = "⟩",
  precedes = "⟨",
  trail = "·",
  nbsp = "␣"
}
