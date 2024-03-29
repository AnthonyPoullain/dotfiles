local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_sources = "recommended",
	set_lsp_keymaps = true,
	manage_nvim_cmp = false,
	suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

local on_attach = require("user.lsp.handlers").on_attach

require("lspconfig").html.setup({
	on_attach = on_attach,
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = false,
				},
			},
		},
	},
})
require("lspconfig").yamlls.setup({
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	settings = {
		yaml = {
			schemaStore = {
				url = "https://www.schemastore.org/api/json/catalog.json",
				enable = true,
			},
		},
	},
})
require("lspconfig").jsonls.setup({
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	textDocument = {
		completion = {
			completionItem = {
				snippetSupport = false,
			},
			settings = {
				json = {
					schemas = require("schemastore").json.schemas({
						select = { "openapi.json" },
					}),
					validate = { enable = true },
				},
			},
		},
	},
})
