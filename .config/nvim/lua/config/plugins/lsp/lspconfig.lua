return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", 
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- neodev.nvim は 2024-07 にアーカイブされ、後継が lazydev.nvim
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- importy cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below fucntions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "LSPの参照を表示 (どこで使われているか)"
        keymap.set("n", "gR", function()
          require("telescope.builtin").lsp_references({
            reuse_win = true,
          })
        end, opts) -- show definition, references

        -- 宣言 (Declaration) がサポートされている場合のみキーマップを設定
        if client.server_capabilities.declarationProvider then
          opts.desc = "宣言へジャンプ"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        end

        opts.desc = "LSPの定義を表示"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

        opts.desc = "LSPの実装を表示"
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

        opts.desc = "LSPの型定義を表示"
        keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

        opts.desc = "コードアクションを表示 (修正案など)"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "名前変更 (リファクタリング)"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "バッファ内の診断を表示"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "現在の行の診断を表示"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "前の診断へジャンプ"
        keymap.set("n", "[d", function()
          vim.diagnostic.jump({ count = -1, float = true })
        end, opts) -- jump to previous diagnostic in buffer

        opts.desc = "次の診断へジャンプ"
        keymap.set("n", "]d", function()
          vim.diagnostic.jump({ count = 1, float = true })
        end, opts) -- jump to next diagnostic in buffer

        opts.desc = "カーソル下のドキュメントを表示"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "LSPを再起動"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })
  end,
}
