require 'nvim-treesitter.highlight'
local hlmap = vim.treesitter.highlighter.hl_map
hlmap["constant"] = "ANonExistingGroup"

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- custom_captures = {
    --   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    --   ["foo.bar"] = "Identifier",
    -- },
  },
}
