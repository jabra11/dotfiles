local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function foo()
    if _LSP_SIG_CFG.floating_window == nil then
        return
    end
    if _LSP_SIG_CFG.floating_window == true then
        _LSP_SIG_CFG.floating_window = false
    else
        _LSP_SIG_CFG.floating_window = true
    end

    print(_LSP_SIG_CFG.floating_window)
end

local opt = {}

map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
map("n", "<C-P>", ":Telescope find_files<cr>", opt)
map("n", "<C-l>", ":Telescope live_grep<cr>", opt)

map("n", "<C-b>", ":Spawn! x-terminal-emulator -e python ~/scripts/vim/config_select.py build <CR>", opt)
map("n", "<F5>", ":Spawn! x-terminal-emulator -e python ~/scripts/vim/config_select.py execute <CR>", opt)

map("n", "<C-j>", ":SymbolsOutline <CR>", opt)
map("n", "<C-h>", ":lua foo() <CR>", opt)

--vim.cmd[[nmap <C-j> <Nop>]]
--vim.cmd[[imap <C-j> <Nop>]]
