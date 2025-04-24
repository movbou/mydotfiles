return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  ----------------------------------------------------------------nvim-treesitter
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "c"
  		},
  	},
  },
	----------------------------------------------------------------------undo tree	
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
	
	-------------------------------------------------------------------- vim be good
	{
		"ThePrimeagen/vim-be-good",
		-- Optionally, lazy-load the plugin only when you run its command:
		cmd = { "VimBeGood" },
		-- You can also remove the `cmd` line to load it at startup if desired
	},
	---------------------------------------------------------------------vim autosave
	{
		"okuuva/auto-save.nvim",
		version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {


			{
				enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
				trigger_events = { -- See :h events
					immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- vim events that trigger an immediate save
					defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
					cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
				},
				-- function that takes the buffer handle and determines whether to save the current buffer or not
				-- return true: if buffer is ok to be saved
				-- return false: if it's not ok to be saved
				-- if set to `nil` then no specific condition is applied
				condition = nil,
				write_all_buffers = false, -- write all buffers when the current one meets `condition`
				noautocmd = false, -- do not execute autocmds when saving
				lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
				debounce_delay = 1000, -- delay after which a pending save is executed
				-- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
				debug = false,
			}
		},
	},
		--vimwiki ----------------------------------------------
  {
    "vimwiki/vimwiki",
    lazy = false, -- Important! Load at startup to ensure commands are registered
    init = function()
      vim.g.vimwiki_list = {
        {
          path = '~/vimwiki/',
          syntax = 'markdown',
          ext = '.md'
        }
      }
    end,
  },

}

