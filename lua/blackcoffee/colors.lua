local util = require("blackcoffee.util")

local M = {}

---@class Palette
M.default = {
	none = "NONE",
	bg_dark = "#000000",
	bg = "#101010",
	bg_highlight = "#2d2d2d",
	terminal_black = "#303030",
	fg = "#f6f3e8",
	fg_dark = "#384048",
	fg_gutter = "#444444",
	dark3 = "#656565",
	comment = "#949494",
	dark5 = "#857b6f",
	blue0 = "#8ac6f2",
	blue = "#8f8f8f",
	cyan = "#949494",
	blue1 = "#a0a8b0",
	blue2 = "#b06e37",
	blue5 = "#cae682",
	blue6 = "#e5786d",
	blue7 = "#e7f6da",
	magenta = "#f6f3e8",
	magenta2 = "#ffb47f",
	purple = "#ffc08c",
	orange = "#101010",
	yellow = "#303030",
	green = "#444444",
	green1 = "#656565",
	green2 = "#6d98e3",
	teal = "#857b6f",
	red = "#8ac6f2",
	red1 = "#8f8f8f",
	git = { change = "#8ac6f2", add = "#e5786d", delete = "#949494" },
	gitSigns = {
		add = "#e5786d",
		change = "#ffc08c",
		delete = "#8ac6f2",
	},
}
---@return ColorScheme
function M.setup(opts)
  opts = opts or {}
  local config = require("blackcoffee.config")

  local style = config.is_day() and config.options.light_style or config.options.style
  local palette = M[style] or {}
  if type(palette) == "function" then
    palette = palette()
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)

  util.bg = colors.bg
  util.day_brightness = config.options.day_brightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.15),
    change = util.darken(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = util.darken(colors.blue1, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
    or config.options.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = config.options.styles.floats == "transparent" and colors.none
    or config.options.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = util.darken(colors.blue0, 0.4)
  colors.bg_search = colors.blue0
  colors.fg_sidebar = colors.fg_dark
  -- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
  colors.fg_float = colors.fg

  colors.error = colors.red1
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  colors.delta = {
    add = util.darken(colors.green2, 0.45),
    delete = util.darken(colors.red1, 0.45),
  }

  config.options.on_colors(colors)
  if opts.transform and config.is_day() then
    util.invert_colors(colors)
  end

  return colors
end

return M
