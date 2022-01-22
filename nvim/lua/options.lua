local opt = vim.opt
local g = vim.g

opt.expandtab = true
opt.shiftwidth = 4
opt.number = true
opt.updatetime = 100
opt.termguicolors = true
opt.cursorline = true

vim.cmd("set completeopt=menuone,noinsert,noselect")
vim.cmd("set shortmess+=c")

-- Use <Tab> and <S-Tab> to navigate through popup menu
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_tab2()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<S-Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_tab2()', {expr = true, noremap = true})

-- don't litter the screen with inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

