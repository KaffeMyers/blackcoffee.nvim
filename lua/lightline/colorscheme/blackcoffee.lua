local colors = require("blackcoffee.colors").setup({ transform = true })

local blackcoffee = {}

blackcoffee.normal = {
  left = { { colors.black, colors.blue }, { colors.blue, colors.fg_gutter } },
  middle = { { colors.fg, colors.bg_statusline } },
  right = { { colors.black, colors.blue }, { colors.blue, colors.fg_gutter } },
  error = { { colors.black, colors.error } },
  warning = { { colors.black, colors.warning } },
}

blackcoffee.insert = {
  left = { { colors.black, colors.green }, { colors.blue, colors.bg } },
}

blackcoffee.visual = {
  left = { { colors.black, colors.magenta }, { colors.blue, colors.bg } },
}

blackcoffee.replace = {
  left = { { colors.black, colors.red }, { colors.blue, colors.bg } },
}

blackcoffee.inactive = {
  left = { { colors.blue, colors.bg_statusline }, { colors.slate, colors.bg } },
  middle = { { colors.fg_gutter, colors.bg_statusline } },
  right = { { colors.fg_gutter, colors.bg_statusline }, { colors.slate, colors.bg } },
}

blackcoffee.tabline = {
  left = { { colors.slate, colors.bg_highlight }, { colors.slate, colors.bg } },
  middle = { { colors.fg_gutter, colors.bg_statusline } },
  right = { { colors.fg_gutter, colors.bg_statusline }, { colors.slate, colors.bg } },
  tabsel = { { colors.blue, colors.fg_gutter }, { colors.slate, colors.bg } },
}

return blackcoffee
