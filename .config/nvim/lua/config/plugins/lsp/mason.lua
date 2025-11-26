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
      "metals",
    }

    require 'mason-lspconfig'.setup {
      automatic_installation = true,
      ensure_installed = ensure_installed, -- 自動でインストールしたいlangage server
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
