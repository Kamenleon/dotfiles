return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewfile" },
  version = "*", -- Use for stability; omit to use 'main' branch for the latest features
  config = true,
  -- ysiw の後に記号で、単語単位を包む
  -- ds の後に記号で、単語単位を覆われた記号を消す
  -- cs の後に2つ記号で、前者を後者へ変更する
  -- あとは公式のコマンド一覧で https://github.com/kylechui/nvim-surround
}
