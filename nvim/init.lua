require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"


require('lspconfig')['efm'].setup{
  settings = ..., -- You must populate this according to the EFM readme
  filetypes = { 'python','cpp','lua', 'javascript', 'html', 'css' }
}
  Commands:
  - EslintFixAll: Fix all eslint problems for this buffer
  
  Default Values:
    cmd = { "vscode-eslint-language-server", "--stdio" }
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" }
    handlers = {
      ["eslint/confirmESLintExecution"] = <function 1>,
      ["eslint/noLibrary"] = <function 2>,
      ["eslint/openDoc"] = <function 3>,
      ["eslint/probeFailed"] = <function 4>
    }
    on_new_config = function(config, new_root_dir)
          -- The "workspaceFolder" is a VSCode concept. It limits how far the
          -- server will traverse the file system when locating the ESLint config
          -- file (e.g., .eslintrc).
          config.settings.workspaceFolder = {
            uri = new_root_dir,
            name = vim.fn.fnamemodify(new_root_dir, ':t'),
          }
        end,
    root_dir = function(startpath)
        return M.search_ancestors(startpath, matcher)
      end
    settings = {
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine"
        },
        showDocumentation = {
          enable = true
        }
      },
      codeActionOnSave = {
        enable = false,
        mode = "all"
      },
      format = true,
      nodePath = "",
      onIgnoredFiles = "off",
      packageManager = "npm",
      quiet = false,
      rulesCustomizations = {},
      run = "onType",
      useESLintClass = false,
      validate = "on",
      workingDirectory = {
        mode = "location"
      }
    }

local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end
dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})
