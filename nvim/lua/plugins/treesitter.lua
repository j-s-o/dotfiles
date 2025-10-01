return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- This ensures parsers are updated when the plugin is updated
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Enable highlighting
      highlight = {
        enable = true,
      },
      -- Enable indentation
      indent = {
        enable = true,
      },
      -- Optionally configure other modules like textobjects, context, etc.
      -- textobjects = { enable = true, ... },
      -- treesitter-context = { enable = true, ... },
      -- auto_install = true, -- Automatically install parsers for detected languages
      ensure_installed = { "go" }, -- Specify languages to install
    })
  end,
}
