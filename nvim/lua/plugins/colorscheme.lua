return { 
  "miikanissi/modus-themes.nvim", 
  priority = 1000,
  config = function()
    -- Load setup configuration first
    require("config.colorscheme")
    -- Then activate the colorscheme
    vim.cmd([[colorscheme modus]])
  end
}

