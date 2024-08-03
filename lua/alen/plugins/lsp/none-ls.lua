local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
}

function M.config()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.completion.spell,

      -- C/C++ Formatting
      null_ls.builtins.formatting.clang_format,
    },

    on_attach = function(client, bufnr)
      local augroup = vim.api.nvim_create_augroup("NullLsFormat", { clear = true })
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ buffer = bufnr })
          end,
        })
      end
    end,
  })
end

return M
