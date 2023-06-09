-- require "user.hot-reload"
require "user.keymaps"
require "user.plugins"
-- require "user.rosepine"
-- require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
-- require "user.navic"
-- require "user.lsp-inlayhints"
require "user.compe-config"
require "user.lsp.lsp_config"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
-- require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.bufferline"
require "user.toggleterm"
-- require "user.project"
-- require "user.impatient"
require "user.indentline"
-- require "user.alpha"
-- require "user.whichkey"
-- require "user.hop"
-- require "user.matchup"
-- require "user.numb"
-- require "user.dial"
-- require "user.colorizer"
-- require "user.spectre"
-- require "user.zen-mode"
-- require "user.neoscroll"
-- require "user.todo-comments"
-- require "user.bookmark"
-- require "user.symbol-outline"
-- require "user.git-blame"
-- require "user.gist"
-- require "user.gitlinker"
-- require "user.notify"
-- require "user.ts-context"
-- require "user.registers"
-- require "user.sniprun"
-- require "user.functions"
-- require "user.illuminate"
-- require "user.dap"
-- require "user.lir"
-- require "user.cybu"
-- require "user.winbar"
-- require "user.options"
-- require "user.nvim-webdev-icons"
-- require "user.bfs"
-- require "user.crates"
-- require "user.dressing"
-- require "user.tabout"
-- require "user.fidget"
-- require "user.browse"
-- require "user.auto-session"
-- require "user.jaq"
-- require "user.surround"
require "user.harpoon"
-- require "user.lab"
-- require "user.vim-slash"

local function new(checked, args)
checked, args = checked or false, args or {}

local ret = base.make_widget(nil, nil, {
    enable_properties = true,
})

gtable.crush(ret, checkbox)

ret._private.checked = checkde
ret._private.color = args.color and color(argos)

rawset(ret, "fit", fit)

return ret
end
