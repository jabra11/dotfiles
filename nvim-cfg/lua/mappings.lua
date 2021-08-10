local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
map("n", "<C-P>", ":Telescope find_files<cr>", opt)
map("n", "<C-l>", ":Telescope live_grep<cr>", opt)

map("n", "<C-b>", ":Start! x-terminal-emulator -e python ~/scripts/vim/config_select.py build<CR>", opt)
map("n", "<F5>", ":Start! x-terminal-emulator -e python ~/scripts/vim/config_select.py execute<CR>", opt)
