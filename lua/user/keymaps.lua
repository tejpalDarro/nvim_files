---@diagnostic disable: undefined-global, lowercase-global
local P = {}
keymaps = P
-- leader --
vim.g.mapleader = ' '

-- key_mapping --
local key_map = function(mode, key, result)
    -- vim.api.nvim_set_keymap(
    vim.keymap.set(
        mode,
        key,
        result,
        { noremap = true, silent = true }
    )
end

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Set control-d AND zz on same
key_map('n', '<C-d>', '<C-d>zz')
key_map('n', '<C-u>', '<C-u>zz')

-- Normal --
-- Better window navigation
key_map("n", "<A-h>", "<C-w>h")
key_map("n", "<A-j>", "<C-w>j")
key_map("n", "<A-k>", "<C-w>k")
key_map("n", "<A-l>", "<C-w>l")

-- nvim tree
key_map("n", "<leader>e", ":NvimTreeToggle<CR>")
key_map("n", "<leader>t", ":NvimTreeToggle<CR>")



--pwd
key_map("n", "<leader>cd", ":cd %:p:h <CR>")
key_map('n', '<leader>cdd', ':TermExec cmd="cd %:p:h " <CR>')

-- Tabs --
key_map("n", "<m-t>", ":tabnew %<cr>")
key_map("n", "<m-y>", ":tabclose<cr>")
key_map("n", "<m-\\>", ":tabonly<cr>")

-- Resize with arrows
key_map("n", "<C-Up>", ":resize -2<CR>")
key_map("n", "<C-Down>", ":resize +2<CR>")
key_map("n", "<C-Left>", ":vertical resize -2<CR>")
key_map("n", "<C-Right>", ":vertical resize +2<CR>")

--Naviagate buffers
key_map("n", "<S-l>", ":bnext<CR>")
key_map("n", "<S-h>", ":bprevious<CR>")

-- keymap("n", "<RightMouse>", ":Alpha<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
--Press jk fast to enter
key_map("i", "jk", "<ESC>")
key_map("n", "<m-c>", "tabclose")

-- Visual --
-- Stay in indent mode
key_map("v", "<", "<gv")
key_map("v", ">", ">gv")

-- Move text up and down
key_map("n", "<leader>aj", ":m .+1<CR>==")
key_map("n", "<leader>ak", ":m .-2<CR>==")

key_map("v", "p", '"_dP')
key_map("v", "P", '"_dP')


-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom
key_map("n", "<leader>h", "<cmd>nohlsearch<cr>")


function P.map_java_keys(bufnr)
    -- java run
    -- keymap('n', '<leader>r', ':! javac %:t && java %:t:r <cr>', term_opts)
    -- local run_java_code = 'javac %:t && java %:t:r'
    -- local run_command = ':lua require("toggleterm").exec("' .. run_java_code .. '")<CR>'
    -- key_map('n', '<leader>r', run_command)
    key_map('n', '<leader>r', ':TermExec cmd="javac %:t && java %:t:r"<CR>')
    local spring_boot_run = 'mvn spring-boot:run -Dspring-boot.run.profiles=local'
    local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
    key_map('n', '<leader>sr', command)
    key_map('n', '<leader>oi', ':lua require("jdtls").organize_imports()<CR>')
    key_map('n', '<leader>jc', ':lua require("jdtls").compile("incremental")')
    key_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
end

-- trouble
key_map("n", "<leader>xx", function() require("trouble").toggle() end)
key_map("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
key_map("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
key_map("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
key_map("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
key_map("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Telescope

local builtin = require('telescope.builtin')
key_map('n', '<leader>p', builtin.find_files)
key_map('n', '<leader>fg', builtin.live_grep)
key_map('n', '<leader>fb', builtin.buffers)
key_map('n', '<leader>fh', builtin.help_tags)

-- NOTE: the fact that tab and ctrl-i are the same is stupid
-- keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
-- keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
-- keymap("n", "<F3>", ":e .<cr>", opts)

return P
