
require 'nvim-treesitter.install'.compilers = { "clang", "go" }
require "user.basic"
require "user.keymaps"
require "user.plugins"
require "user.completions"
require "user.trouble"
require "user.colorscheme"
require "user.lsp-config"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
-- require "user.barbar"
-- require "user.notify"
require "user.dap"
require "user.surround"
require "user.harpoon"
--
-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })
-- local function new(checked, args)
-- checked, args = checked or false, args or {}
--
-- local ret = base.make_widget(nil, nil, {
--     enable_properties = true,
-- })
--
-- gtable.crush(ret, checkbox)
--
-- ret._private.checked = checkde
-- ret._private.color = args.color and color(argos)
--
-- rawset(ret, "fit", fit)
--
-- return ret
-- end
--
