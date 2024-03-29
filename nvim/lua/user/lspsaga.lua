local keymap = vim.keymap.set
local saga = require("lspsaga")

saga.setup({
	ui = {
		-- currently only round theme
		theme = "round",
		-- this option only work in neovim 0.9
		title = true,
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			normal_bg = "#1d1536",
			--title background color
			title_bg = "#afd700",
			red = "#e95678",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
		kind = {},
	},
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = "<C-d>",
		scroll_up = "<C-u>",
	},
	request_timeout = 2000,
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		cache_code_action = true,
		sign = false,
		update_time = 150,
		sign_priority = 20,
		virtual_text = false,
	},
	diagnostic = {
		on_insert = false,
		show_code_action = false,
		show_source = false,
		jump_num_shortcut = true,
		keys = {
			exec_action = "o",
			quit = "q",
			go_action = "g",
		},
	},
	rename = {
		quit = "<C-c>",
		exec = "<CR>",
		mark = "x",
		confirm = "<CR>",
		in_select = true,
		whole_project = true,
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "o",
			expand_collapse = "u",
			quit = "q",
		},
	},
	symbol_in_winbar = {
		enable = false,
		separator = " ",
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gR", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga show_definition<CR>", { silent = true })
-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
--[[ keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true }) ]]
-- Diagnsotic jump can use `<c-o>` to jump back
--[[ keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true }) ]]
--[[ keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true }) ]]
-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
--[[ keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true }) ]]
-- Hover Doc
--[[ keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true }) ]]
-- Float terminal
--[[ keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true }) ]]
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
--[[ keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true }) ]]
-- close floaterm
-- keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
