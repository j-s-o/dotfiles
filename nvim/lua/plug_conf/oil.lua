local oil = require("oil").setup({
  default_file_explorer = true,
  skip_confirm_for_simple_edits = false,
  prompt_save_on_select_new_entry = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
