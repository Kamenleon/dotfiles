return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "このファイルの全履歴を表示" },
    { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Diffviewを閉じる" },
  },
  config = true,
}
