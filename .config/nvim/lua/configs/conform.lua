local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
	    c   = { "c_formatter_42" },
    cpp = { "c_formatter_42" },
  },


  formatters = {
    c_formatter_42 = {
      inherit = false,  -- optional: disable merging with any defaults
      command = "/home/gyro/.venv/bin/c_formatter_42",
      args = { "$FILENAME" },  -- removed --stdin-filepath from here
      stdin = false,  -- since the tool doesn’t support stdin input
      cwd = function(ctx)
        return vim.fn.getcwd()
      end,
      condition = function(ctx)
        return vim.fn.executable("/home/gyro/.venv/bin/c_formatter_42") == 1
      end,
    },
  },

--    format_on_save = {
--   --   -- These options will be passed to conform.format()
--   timeout_ms = 500,
--   lsp_fallback = true,
--   },
 }
return options
