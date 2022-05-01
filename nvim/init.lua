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

-- require('lspconfig')['efm'].setup{
--   settings = ..., -- You must populate this according to the EFM readme
--   filetypes = { 'python','cpp','lua', 'javascript', 'html', 'css' }
-- }
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()

require'lspconfig'.eslint.setup{}

-- vim.diagnostic.config({
--   virtual_text = true,
--   underline = true,
--   update_in_insert = false,
-- })


-- local dap_install = require("dap-install")
-- local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()
--
-- for _, debugger in ipairs(dbg_list) do
-- 	dap_install.config(debugger)
-- end
-- dap_install.setup({
-- 	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
-- })
