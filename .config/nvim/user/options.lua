local options = {
    --cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    encoding = "utf-8",                      -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    --signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    tabstop = 2,                             -- insert 2 spaces for a tab
    number = true,                           -- set numbered lines
    relativenumber = false,                  -- set relative numbered lines
    numberwidth = 2,
    expandtab = true,
    scrolloff = 6,
    wrap = false,
    showtabline = 2,
    termguicolors = true,
  }
  
  vim.opt.shortmess:append "c"
  
  for k, v in pairs(options) do
    vim.opt[k] = v
  end