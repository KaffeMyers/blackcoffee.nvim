local c = require("blackcoffee.colors").setup({ transform = true })

local M = {
  normal = { bg = c.none, fg = c.fg_dark },

  ellipsis = { fg = c.terracotta },
  separator = { fg = c.terracotta },
  modified = { fg = c.warning },

  dirname = { fg = c.terracotta },
  basename = { fg = c.fg_dark, bold = true },
  context = { fg = c.fg_dark },

  context_file = { fg = c.fg_dark },
  context_module = { fg = c.yellow },
  context_namespace = { fg = c.yellow },
  context_package = { fg = c.blue },
  context_class = { fg = c.orange },
  context_method = { fg = c.blue },
  context_property = { fg = c.mint },
  context_field = { fg = c.mint },
  context_constructor = { fg = c.blue },
  context_enum = { fg = c.orange },
  context_interface = { fg = c.orange },
  context_function = { fg = c.blue },
  context_variable = { fg = c.magenta },
  context_constant = { fg = c.magenta },
  context_string = { fg = c.green },
  context_number = { fg = c.orange },
  context_boolean = { fg = c.orange },
  context_array = { fg = c.orange },
  context_object = { fg = c.orange },
  context_key = { fg = c.purple },
  context_null = { fg = c.salmon },
  context_enum_member = { fg = c.mint },
  context_struct = { fg = c.orange },
  context_event = { fg = c.orange },
  context_operator = { fg = c.mint },
  context_type_parameter = { fg = c.mint },
}

return M
