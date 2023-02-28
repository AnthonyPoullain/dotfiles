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

--[[ require("cmp").setup({ ]]
--[[ 	sources = { ]]
--[[ 		{ ]]
--[[ 			name = "nvim_lsp", ]]
--[[ 			entry_filter = function(entry) ]]
--[[ 				return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind() ]]
--[[ 			end, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ }) ]]
