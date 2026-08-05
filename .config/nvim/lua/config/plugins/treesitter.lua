return {
  "nvim-treesitter/nvim-treesitter",
  -- master ブランチは Neovim 0.11 までで凍結されている。0.12 以降は main を使う
  branch = "main",
  -- main ブランチは lazy-load に対応していない
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")

    -- 導入したいパーサ (c/lua/markdown/query/vim/vimdoc は Neovim 同梱だが、
    -- main のクエリと版を揃えるため nvim-treesitter 側で管理する)
    local parsers = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "scala",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
    }

    -- ensure_installed の代わり。導入済みのパーサに対しては no-op
    treesitter.install(parsers)

    -- main には configs.setup が無いので、ハイライトは自分で有効化する
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true }),
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })

    -- 旧 configs.setup({ autotag = ... }) の代替
    require("nvim-ts-autotag").setup()
  end,
}
