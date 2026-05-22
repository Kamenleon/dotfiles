require("config.core.options")
require("config.core.keymaps")

-- ヤンクした時にハイライトする
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

