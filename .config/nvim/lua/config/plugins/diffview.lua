return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "このファイルの全履歴を表示" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "リポジトリ全体のコミット履歴" },
    { "<leader>gl", "<cmd>DiffviewOpen HEAD~1..HEAD<cr>", desc = "直近コミットの変更ファイル" },
    { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Diffviewを閉じる" },
  },
  config = true,
}
