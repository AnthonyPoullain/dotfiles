require("catppuccin").setup({
		flavour = "macchiato", -- latte, frappe, macchiato, mocha
		color_overrides = {
				mocha = {
						--[[ base = "#000000", ]]
				},
		},
		highlight_overrides = {
				--[[ mocha = function(mocha) ]]
				--[[ 	return { ]]
				--[[ 		NvimTreeNormal = { bg = mocha.none }, ]]
				--[[ 	} ]]
				--[[ end, ]]
		},
		background = { -- :h background
				light = "latte",
				dark = "macchiato",
		},
		transparent_background = false,
		term_colors = false,
		dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		styles = {
				comments = { "italic" },
				conditionals = {},
				loops = {},
				functions = {},
				keywords = { "bold" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = { "bold" },
				properties = {},
				types = {},
				operators = {},
		},
		custom_highlights = {},
		integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				notify = false,
				mini = false,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
})
