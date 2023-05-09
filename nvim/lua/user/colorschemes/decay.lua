local present, decay = pcall(require, "decay")

if not present then
	error("Can't import decay, make sure u installed it! :v")
end

decay.setup({
	style = "default",
	cmp = {
		block_kind = false,
	},
	italics = {
		code = false,
		comments = true, -- to disable italic comments, replace to true to enable
	},
	nvim_tree = {
		contrast = false, -- or false to disable tree contrast
	},
})
