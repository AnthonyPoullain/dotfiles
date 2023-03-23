local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	--[[  ensure_installed = { ]]
	--[[  	"javascript", ]]
	--[[  	"typescript", ]]
	--[[  	"json", ]]
	--[[  	"lua", ]]
	--[[  	"python", ]]
	--[[  	"html",  ]]
	--[[  	"css",  ]]
	--[[  	"yaml" ]]
	--[[ },  ]]
	-- one of "all", "maintained" (parsers with maintainers), or a list of languages ]]
	--[[ -- ensure_installed = "all", ]]
	sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "html" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	tree_docs = { enable = true },
})
