local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

ls.filetype_extend("javascript", { "html" })
ls.filetype_extend("javascriptreact", { "react", "html" })

ls.filetype_extend("typescript", { "javascript", "html" })
ls.filetype_extend("typescriptreact", { "react", "javascript", "html" })

--[[ ls.filetype_extend("*.ts", { "react", "javascriptreact", "html" }) ]]
--[[ ls.filetype_extend("*.tsx", { "react", "javascriptreact", "html" }) ]]

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

-- Every unspecified option will be set to the default.
ls.setup({
	history = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	--[[ enable_autosnippets = true, ]]
	-- mapping for cutting selected text so it's usable as SELECT_DEDENT,
	-- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
	store_selection_keys = "<Tab>",
	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

ls.add_snippets("javascriptreact", {
	s(
		"us",
		fmt("const [{}, set{setter}] = useState({})", {
			i(1, "value"),
			i(2, "initialValue"),
			setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1),
		})
	),
})

ls.add_snippets("typescriptreact", {
	s(
		"us",
		fmt("const [{}, set{setter}] = useState({})", {
			i(1, "value"),
			i(2, "initialValue"),
			setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1),
		})
	),
})
