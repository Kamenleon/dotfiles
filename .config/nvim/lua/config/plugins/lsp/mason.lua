return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "→",
          package_uninstalled = "×",
        },
      },
    })

    -- lspを入れる際に設定するところ
    local ensure_installed = {
      "lua_ls",
    }

    require 'mason-lspconfig'.setup {
      ensure_installed = ensure_installed, -- 自動でインストールしたいlangage server
      -- v2 の既定では導入済みサーバを自動で vim.lsp.enable() するが、
      -- metals は nvim-metals が管理しているので衝突を避けて明示的に有効化する
      automatic_enable = false,
    }

    -- language serverの設定をする
    vim.lsp.config("lua_ls", {
      -- nvim-lspconfigが設定したコンフィグにsettingを追加する
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
        },
      },
    })

    vim.lsp.enable(ensure_installed)
  end,
}
