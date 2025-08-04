vim.cmd("colorscheme darkearth")

local function make_transparent(group)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if ok then
    vim.api.nvim_set_hl(0, group, { fg = hl.fg, bg = "NONE" })
  end
end

local ui_groups = {
    "Normal",
    "NormalFloat",
    "NormalNC",
    "Comment",
    "LineNr",
    "LineNrAbove",
    "LineNrBelow",
    "SignColumn",
    "MsgArea",
    "MsgSeparator",
    "ErrorMsg",
    "WarningMsg",
    "ModeMsg",
    "CommandLine",

    -- DAP virtual text
    "NvimDapVirtualText",
    "NvimDapVirtualTextChanged",
    "NvimDapVirtualTextChangedHighlight",
    "NvimDapVirtualTextChangedRemoved",
    "NvimDapVirtualTextInfo",
    "NvimDapVirtualTextError",

    -- Diagnostics (virtual text & signs)
    "DiagnosticVirtualTextError",
    "DiagnosticVirtualTextWarn",
    "DiagnosticVirtualTextInfo",
    "DiagnosticVirtualTextHint",
    "DiagnosticSignError",
    "DiagnosticSignWarn",
    "DiagnosticSignInfo",
    "DiagnosticSignHint",
    "DiagnosticUnnecessary",
    "DiagnosticDeprecated",
}

for _, group in ipairs(ui_groups) do
  make_transparent(group)
end
