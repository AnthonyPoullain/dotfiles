local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	-- use "lukas-reineke/indent-blankline.nvim"
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- Colorschemes
	use("navarasu/onedark.nvim")
	use("EdenEast/nightfox.nvim")
	use("marko-cerovac/material.nvim")
	use("morhetz/gruvbox")
	use({ "shaunsingh/oxocarbon.nvim", run = "./install.sh" })

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("styled-components/vim-styled-components")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({
				-- your configuration
				-- Options with default value
				-- "single" | "double" | "rounded" | "bold" | "plus"
				border_style = "single",
				--the range of 0 for fully opaque window (disabled) to 100 for fully
				--transparent background. Values between 0-30 are typically most useful.
				saga_winblend = 0,
				-- when cursor in saga window you config these to move
				move_in_saga = { prev = "<C-p>", next = "<C-n>" },
				-- Error, Warn, Info, Hint
				-- use emoji like
				-- { "🙀", "😿", "😾", "😺" }
				-- or
				-- { "😡", "😥", "😤", "😐" }
				-- and diagnostic_header can be a function type
				-- must return a string and when diagnostic_header
				-- is function type it will have a param `entry`
				-- entry is a table type has these filed
				-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
				diagnostic_header = { " ", " ", " ", "ﴞ " },
				-- preview lines of lsp_finder and definition preview
				max_preview_lines = 10,
				-- use emoji lightbulb in default
				code_action_icon = "💡",
				-- if true can press number to execute the codeaction in codeaction window
				code_action_num_shortcut = true,
				-- same as nvim-lightbulb but async
				code_action_lightbulb = {
					enable = true,
					enable_in_insert = true,
					cache_code_action = true,
					sign = true,
					update_time = 150,
					sign_priority = 20,
					virtual_text = true,
				},
				-- finder icons
				finder_icons = {
					def = "  ",
					ref = "諭 ",
					link = "  ",
				},
				-- finder do lsp request timeout
				-- if your project big enough or your server very slow
				-- you may need to increase this value
				finder_request_timeout = 1500,
				finder_action_keys = {
					open = { "o", "<CR>" },
					vsplit = "s",
					split = "i",
					tabe = "t",
					quit = { "q", "<ESC>" },
				},
				code_action_keys = {
					quit = "q",
					exec = "<CR>",
				},
				definition_action_keys = {
					edit = "<C-c>o",
					vsplit = "<C-c>v",
					split = "<C-c>i",
					tabe = "<C-c>t",
					quit = "q",
				},
				rename_action_quit = "<C-c>",
				rename_in_select = true,
				-- show symbols in winbar must nightly
				-- in_custom mean use lspsaga api to get symbols
				-- and set it to your custom winbar or some winbar plugins.
				-- if in_cusomt = true you must set in_enable to false
				symbol_in_winbar = {
					in_custom = false,
					enable = true,
					separator = " ",
					show_file = true,
					-- define how to customize filename, eg: %:., %
					-- if not set, use default value `%:t`
					-- more information see `vim.fn.expand` or `expand`
					-- ## only valid after set `show_file = true`
					file_formatter = "",
					click_support = false,
				},
				-- show outline
				show_outline = {
					win_position = "right",
					--set special filetype win that outline window split.like NvimTree neotree
					-- defx, db_ui
					win_with = "",
					win_width = 30,
					auto_enter = true,
					auto_preview = true,
					virt_text = "┃",
					jump_key = "o",
					-- auto refresh when change buffer
					auto_refresh = true,
				},
				-- custom lsp kind
				-- usage { Field = 'color code'} or {Field = {your icon, your color code}}
				custom_kind = {},
				-- if you don't use nvim-lspconfig you must pass your server name and
				-- the related filetypes into this table
				-- like server_filetype_map = { metals = { "sbt", "scala" } }
				server_filetype_map = {},
			})
		end,
	})

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	--[[ use({ "williamboman/mason.nvim" }) ]]

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	--[[ use("nvim-treesitter/nvim-tree-docs") ]]

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- css color
	use("ap/vim-css-color")

	-- tagbar
	use("preservim/tagbar")

	-- Boolean toggler
	use("rmagatti/alternate-toggler")

	-- smooth scroll
	use("karb94/neoscroll.nvim")

	-- JSDocs
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*"
	})
	use({
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	})

	-- debug
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")

	-- tests
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	})

	--[[ use("David-Kunz/jester") ]]
	--[[ use("vim-test/vim-test") ]]

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
