local function define_augroups(definitions)

for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')

    for _, def in pairs(definition) do
        local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
        vim.cmd(command)
    end

    vim.cmd('augroup END')
  end
end

define_augroups(
    {
        _general_settings = {
            {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'IncSearch\', timeout = 150})'},
            {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
            {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
            {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
            {'VimLeavePre', '*', 'set title set titleold='},
        },

    }
)
