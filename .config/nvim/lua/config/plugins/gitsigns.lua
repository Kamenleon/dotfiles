return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      current_line_blame = true,
      current_line_blame_opts = { delay = 500 },
    })
    local keymap = vim.keymap
    keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "変更箇所のプレビュー" })
    keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "この行の変更者詳細" })
  end,
}
