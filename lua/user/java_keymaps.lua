local P = {}
local keymaps = P

local key_map = function(mode, key, result) 
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        {noremap = true, silent = true}
)
end

function P.map_java_keys(bufnr)
    local spring_boot_run = 'mvn spring-boot:run -Dspring-boot.run.profiles=local'
    local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
    key_map('n', '<leader>sr', command)
    key_map('n', '<leader>oi', ':lua require("jdtls").organize_imports()<CR>')
    key_map('n', '<leader>jc', ':lua require("jdtls").compile("incremental")')
end

return P
