set nocompatible              " be iMproved, required
filetype off                  " required

"vim-plug stuff
call plug#begin('~/.nvim/plugged')
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/completion-nvim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-dispatch'
Plug 'wakatime/vim-wakatime'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" general settings
set updatetime=5
set background=dark
set number
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme customColours
syntax on

" start: custom keymaps

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50

"" fzf
"map <C-P> :FZF <CR>

" telescope
nnoremap <C-P> <cmd>Telescope find_files<cr>
nnoremap <C-l> <cmd>Telescope live_grep<cr>

" build systems
map <silent> <C-b> :Start! x-terminal-emulator -e python ~/scripts/vim/config_select.py build <CR>
map <silent> <F5> :Start! x-terminal-emulator -e python ~/scripts/vim/config_select.py execute<CR>

" end: custom keymaps


" _________ 
"< plugins >
" --------- 
"        \   ^__^
"         \  (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||
"

" treesitter stuff ----------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- custom_captures = {
    --   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    --   ["foo.bar"] = "Identifier",
    -- },
  },
}
EOF
" treesitter stuf ###################

" nvim-lua/completion-nvim stuff --------------------
autocmd BufEnter * lua require'completion'.on_attach()
" nvim-lua/completion-nvim stuff ####################

" lspconfig stuff --------------------------------
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

require'lspconfig'.clangd.setup {
    cmd = { "clangd", "--background-index", "-j=12", "--pch-storage=memory", "--limit-results=0", "--header-insertion=never", "--all-scopes-completion=false" },
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp", "cu", "cxx", "cc" },
    flags = {
      debounce_text_changes = 150,
    }
}

local servers = { "pyright", "rust_analyzer", "tsserver", "texlab", "cmake",
                  "hls", "gopls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
" lspconfig stuff ##########################################

