return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- telescope 0.1.x は vim.lsp.util.symbols_to_items() を position_encoding なしで呼ぶ。
    -- Neovim 0.11 はその場合 current buffer から encoding を引くため、
    -- Telescope のプロンプトバッファ (LSP 未アタッチ) がカレントになる
    -- lsp_dynamic_workspace_symbols では nil 参照で落ちていた。
    -- 渡された bufnr 側から encoding を解決して回避する。
    local symbols_to_items = vim.lsp.util.symbols_to_items
    vim.lsp.util.symbols_to_items = function(symbols, bufnr, encoding)
      if encoding == nil then
        local client = vim.lsp.get_clients({ bufnr = bufnr or 0 })[1]
        encoding = client and client.offset_encoding or "utf-16"
      end
      return symbols_to_items(symbols, bufnr, encoding)
    end

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev default
            ["<C-j>"] = actions.move_selection_next, -- move to next default
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "ファイル検索 (カレントディレクトリ)" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "最近開いたファイルを検索" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "文字列で全文検索" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "カーソル下の文字列を検索" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "TODOを検索" })

    -- Scala / LSP シンボル検索の追加
    keymap.set("n", "<leader>fm", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "メソッド・クラス検索 (ワークスペース全体)" })
    keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "ファイル内のアウトライン表示" })

    -- Git 関連の検索を追加
    keymap.set("n", "<leader>gc", "<cmd>Telescope git_bcommits<cr>", { desc = "このファイルのコミット履歴 (簡易版)" })
  end,
}
