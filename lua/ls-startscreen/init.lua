vim.g.dashboard_custom_header = {

' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',

}

vim.g.dashboard_custom_section = {
    b = {description = {'  Find File          '}, command = 'Telescope find_files'},
    c = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    d = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    e = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
}

vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_footer = {"lucaschreiner.github.io"}
