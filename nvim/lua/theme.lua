local theme = require("user_config").ui.theme

vim.g.theme = theme
local present, base16 = pcall(require, "base16")

if present then
    base16(base16.themes(theme), true)
    require "highlights"
    return true
else
    return false
end
