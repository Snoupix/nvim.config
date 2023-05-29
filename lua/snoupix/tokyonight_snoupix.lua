local theme = {
  comment = { fg = "#565f89", modifiers = { "italic" } },
  constant = { fg = "#ff9e64" },
  ["constant.character.escape"] = { fg = "#bb9af7" },
  ["function"] = { fg = "#7aa2f7" },
  ["function.macro"] = { fg = "#89ddff" },
  keyword = { fg = "#bb9af7", modifiers = { "italic" } },
  ["keyword.control"] = { fg = "#bb9af7" },
  ["keyword.control.import"] = { fg = "#89ddff" },
  ["keyword.operator"] = { fg = "#89ddff" },
  ["keyword.function"] = { fg = "#bb9af7" },
  operator = { fg = "#89ddff" },
  punctuation = { fg = "#89ddff" },
  string = { fg = "#2ac3de" },
  ["string.regexp"] = { fg = "#7dcfff" },
  tag = { fg = "#f7768e" },
  ["type"] = { fg = "#2ac3de" },
  namespace = { fg = "#7aa2f7" },
  variable = { fg = "#c0caf5" },
  ["variable.builtin"] = { fg = "#8154d3", modifiers = { "italic" } },
  ["variable.other.member"] = { fg = "#73daca" },
  ["variable.parameter"] = { fg = "#e0af68" },
  ["diff.plus"] = { fg = "#9ece6a" },
  ["diff.delta"] = { fg = "#ff9e64" },
  ["diff.minus"] = { fg = "#f7768e" },
  ["ui.background"] = {},
  ["ui.cursor"] = { modifiers = { "reversed" } },
  ["ui.cursor.match"] = { fg = "#ff9e64", modifiers = { "bold" } },
  ["ui.cursor.primary"] = { modifiers = { "reversed" } },
  ["ui.cursorline.primary"] = { bg = "#16161e" },
  ["ui.help"] = { fg = "#7aa2f7", bg = "#16161e" },
  ["ui.linenr"] = { fg = "#a9b1d6" },
  ["ui.linenr.selected"] = { fg = "#a9b1d6" },
  ["ui.menu"] = { fg = "#a9b1d6", bg = "#16161e" },
  ["ui.menu.selected"] = { bg = "#30374b" },
  ["ui.popup"] = { fg = "#a9b1d6", bg = "#16161e" },
  ["ui.selection"] = { bg = "#30374b" },
  ["ui.selection.primary"] = { bg = "#30374b" },
  ["ui.statusline"] = { fg = "#a9b1d6", bg = "#16161e" },
  ["ui.statusline.inactive"] = { fg = "#363b54", bg = "#16161e" },
  ["ui.statusline.normal"] = { fg = "#000000", bg = "#7aa2f7" },
  ["ui.statusline.insert"] = { fg = "#000000", bg = "#9ece6a" },
  ["ui.statusline.select"] = { fg = "#000000", bg = "#bb9af7" },
  ["ui.text"] = { fg = "#a9b1d6" },
  ["ui.text.focus"] = { fg = "#a9b1d6", modifiers = { "dim" } },
  ["ui.virtual.ruler"] = { bg = "#a9b1d6" },
  ["ui.virtual.whitespace"] = { fg = "#a9b1d6" },
  ["ui.window"] = { fg = "#000000" },
  error = { fg = "#f7768e" },
  warning = { fg = "#e0af68" },
  info = { fg = "#7aa2f7" },
  hint = { fg = "#2ac3de" },
  diagnostic = { modifiers = { "dim" } },
  special = { fg = "#ff9e64" },
  ["markup.heading"] = { fg = "#2ac3de", modifiers = { "bold" } },
  ["markup.list"] = { fg = "#2ac3de" },
  ["markup.bold"] = { fg = "#ff9e64", modifiers = { "bold" } },
  ["markup.italic"] = { fg = "#e0af68", modifiers = { "italic" } },
  ["markup.link.url"] = { fg = "#9ece6a" },
  ["markup.link.text"] = { fg = "#9aa5ce" },
  ["markup.quote"] = { fg = "#e0af68", modifiers = { "italic" } },
  ["markup.raw"] = { fg = "#2ac3de" },
}

local t = {}

function t.load()
  local colors = {}

  for group, properties in pairs(theme) do
    local fg = properties.fg
    local bg = properties.bg
    local sp = properties.sp
    local gui = properties.gui
    local guisp = properties.guisp

    if fg ~= nil then
      colors[group .. '_fg'] = fg
    end
    if bg ~= nil then
      colors[group .. '_bg'] = bg
    end
    if sp ~= nil then
      colors[group .. '_sp'] = sp
    end
    if gui ~= nil then
      colors[group .. '_gui'] = gui
    end
    if guisp ~= nil then
      colors[group .. '_guisp'] = guisp
    end
  end

  -- vim.api.nvim_put({ 'hi clear', 'syntax reset', 'let g:colors_name = "helix"' }, '', true, true)
  for group, color in pairs(colors) do
    local command = string.format('hi %s guifg=%s', group, color)
    vim.api.nvim_command(command)
  end
end

t.load()

return t
