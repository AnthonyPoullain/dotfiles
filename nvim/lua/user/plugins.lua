local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
	"christoomey/vim-tmux-navigator",
	"b0o/schemastore.nvim",
	"wbthomason/packer.nvim",
	"nvim-lua/plenary.nvim",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
	},
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"ahmedkhalf/project.nvim",
	"goolord/alpha-nvim",
	"antoinemadec/FixCursorHold.nvim",
	"folke/which-key.nvim",
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	"jose-elias-alvarez/null-ls.nvim",
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				keymaps = {
					submit = "<C-s>",
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	"folke/tokyonight.nvim",
	"frenzyexists/aquarium-vim",
	--[[ "navarasu/onedark.nvim", ]]
	--[[ "EdenEast/nightfox.nvim", ]]
	--[[ "marko-cerovac/material.nvim", ]]
	--[[ "morhetz/gruvbox", ]]
	"nyoom-engineering/oxocarbon.nvim",
	"rebelot/kanagawa.nvim",
	--[[ { "catppuccin/nvim", name = "catppuccin" }, ]]
	--[[ "Shatur/neovim-ayu", ]]
	--[[ "projekt0n/github-nvim-theme", ]]
	{ "decaycs/decay.nvim", as = "decay" },
	"lunarvim/horizon.nvim",
	{
		"hardhackerlabs/theme-vim",
		--[[ config = function() ]]
		--[[   vim.cmd.colorscheme 'hardhacker' ]]
		--[[ end, ]]
	},
	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	"styled-components/vim-styled-components",
	--LSP Zero
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},
	-- LSP Saga
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	config = function()
		require("lspsaga").setup({})
	end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--Please make sure you install markdown and markdown_inline parser
		{ "nvim-treesitter/nvim-treesitter" },
	},
	-- Telescope
	"nvim-telescope/telescope.nvim",
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/playground",
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- Git
	"lewis6991/gitsigns.nvim",
	-- css color
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- Boolean toggler
	"rmagatti/alternate-toggler",
	-- JSDocs
	{ "heavenshell/vim-jsdoc", build = "make install" },
	--[[ { ]]
	--[[ 	"danymat/neogen", ]]
	--[[ 	config = function() ]]
	--[[ 		require("neogen").setup({ ]]
	--[[ 			enabled = true, ]]
	--[[ 			snippet_engine = "luasnip", ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ 	dependencies = "nvim-treesitter/nvim-treesitter", ]]
	--[[ }, ]]
	-- debug
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	-- tests
	{
		"rcarriga/neotest",
		dependencies = {
			"marilari88/neotest-vitest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest"),
				},
			})
		end,
	},
	"David-Kunz/jester",
	-- Lua
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
}
require("lazy").setup(plugins, opts)
