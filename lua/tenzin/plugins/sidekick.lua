return {
	"folke/sidekick.nvim",
	opts = {
		-- add any options here
		cli = {
			mux = {
				backend = "tmux",
				enabled = false,
			},
		},
	},
	init = function()
		-- Helper function to always create a new terminal session, bypassing selection UI
		local function new_terminal(tool_name, opts)
			opts = opts or {}
			local Config = require("sidekick.config")
			local Session = require("sidekick.cli.session")
			local State = require("sidekick.cli.state")

			-- Setup session backends if not already done
			Session.setup()

			-- Get the tool
			local tool = Config.get_tool(tool_name)
			if not tool then
				vim.notify("Tool '" .. tool_name .. "' not found", vim.log.levels.ERROR)
				return
			end

			-- Create a new session directly
			local session = Session.new({ tool = tool_name, backend = "terminal" })

			-- Attach the session (this creates the terminal)
			session = Session.attach(session)

			-- Get the state and show/focus the terminal
			local state = State.get_state(session)
			if state.terminal then
				state.terminal:show()
				if opts.focus then
					state.terminal:focus()
				end
			end

			return state
		end

		-- Make it globally accessible for keybindings if needed
		_G.sidekick_new_terminal = new_terminal


		if vim.fn.executable('claude') ~= 1 then
		  return
		end

		-- Auto-start Claude Code window in background on startup
		vim.defer_fn(function()
			new_terminal("claude", { focus = false })
		end, 100)

		vim.defer_fn(function()
			require("sidekick.cli").toggle("claude")
		end, 100)
	end,
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<leader>cl",
      function() require("sidekick.nes").clear() end,
      desc = "Clear All Edit Suggestions",
      mode = { "n" }
    },
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle() end,
      mode = { "n", "v" },
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Sidekick Select CLI",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").send({ selection = true }) end,
      mode = { "v" },
      desc = "Sidekick Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "v" },
      desc = "Sidekick Select Prompt",
    },
    {
      "<c-.>",
      function() require("sidekick.cli").focus() end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
    -- Example of a keybinding to open Claude directly
    {
      "<leader>ac",
      function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
      desc = "Sidekick Claude Toggle",
      mode = { "n", "v" },
    },
  },
}
