local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

--[[ require("mason").setup() ]]
require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

--[[ require("lspconfig").yamlls.setup({ ]]
--[[ 	on_attach = require("user.lsp.handlers").on_attach, ]]
--[[ 	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()), ]]
--[[ 	settings = { ]]
--[[ 		yaml = { ]]
--[[ 			schemas = { ]]
--[[ 				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = "/*", ]]
--[[ 			}, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ }) ]]

require("lspconfig").yamlls.setup({
	on_attach = require("user.lsp.handlers").on_attach,
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
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	settings = {
		json = {
			schemas = require("schemastore").json.schemas({
				select = { "openapi.json" },
			}),
			validate = { enable = true },
		},
	},
})
