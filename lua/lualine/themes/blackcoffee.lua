local colors = require("blackcoffee.colors").setup({ transform = true })
local config = require("blackcoffee.config").options

local blackcoffee = {}

blackcoffee.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

blackcoffee.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

blackcoffee.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.yellow },
}

blackcoffee.visual = {
  a = { bg = colors.magenta, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.magenta },
}

blackcoffee.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

blackcoffee.terminal = {
  a = {bg = colors.green1, fg = colors.black },
  b = {bg = colors.fg_gutter, fg=colors.green1 },
}

blackcoffee.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(blackcoffee) do
    mode.a.gui = "bold"
  end
end

return blackcoffee
