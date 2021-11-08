--local present, nvimtree = pcall(require, "nvim-tree")
--
--if not present then
--   return
--end

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
--g.nvim_tree_git_hl = 0
g.nvim_tree_refresh_wait = 100
--g.nvim_tree_gitignore = 0
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
g.nvim_tree_special_files = {}
--
g.nvim_tree_show_icons = {
   folders = 1,
   -- folder_arrows= 1
   files = 1,
   git = 0,
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      default = "",
      empty = "", -- 
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

nvimtree.setup {
   hide_dotfiles = true,
   disable_netrw = true,
   hijack_netrw = true,
   auto_close = false,
   open_on_tab = true,
   hijack_cursor = true,
   update_cwd = false,
   update_focused_file = {
      enable = false,
      update_cwd = false,
   },
   view = {
      allow_resize = true,
      side = "left",
      width = 40,
   },
}
