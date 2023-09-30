local util = require("blackcoffee.util")
-- a comment
local M = {}

---@class Palette
M.default = {
	none           = "NONE",

	-- Colors for representing original term colors
	blue           = "#a1c4f2",
	cyan           = "#22c3c3", --#007acc
	green          = "#51b62f", --#cae682
	magenta        = "#b62f95", --#ba55d3
	red            = "#bd2828", --#e5786d
	yellow         = "#e6e600", --#b3b319 (old)

	-- other defaults
	bg_dark        = "#111111",
	bg             = "#222222",
	bg_highlight   = "#444444",
	terminal_black = "#555555",

	fg             = "#e6e6e6", --#f7f3e1
	fg_dark        = "#d1d1d1", --#e4a785
	fg_gutter      = "#343434", --#b2b2b2
	comment        = "#a6a6a6",

	-- additional colors
	dark3          = "#725752",
	dark5          = "#8a6d3b",
	blue0          = "#629dea",
	blue1          = "#e08e5e",
	blue2          = "#ffdcb2",
	blue5          = "#ffcc99",
	blue6          = "#bc986a",
	blue7          = "#8e735b",
	magenta2       = "#b87333",
	red1           = "#f5978e",
	green1         = "#e2f0c2",
	green2         = "#669966",
	purple         = "#944dff",
	orange         = "#ff9933",
	teal           = "#009999",
}

M.default.git = {
	add = M.default.green,
	change = M.default.yellow,
	delete = M.default.red,
}

M.default.gitSigns = {
	add = M.default.green,
	change = M.default.yellow,
	delete = M.default.red1,
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
