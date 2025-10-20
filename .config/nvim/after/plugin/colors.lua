vim.cmd("colorscheme darkearth")

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "text",
--     callback = function()
--         -- change the foreground (fg) and background (bg) for Normal
--         vim.api.nvim_set_hl(0, "Normal", { fg = "#434D44", bg = "NONE" })
--     end,
-- })

vim.api.nvim_set_hl(0, "Normal", { fg = "#434D44", bg = "NONE" })

local function make_transparent(group)
  local ok, hl = pcall(function()
    -- resolve links first
    local linked = vim.api.nvim_get_hl(0, { name = group })
    if linked.link then
      return vim.api.nvim_get_hl(0, { name = linked.link })
    end
    return linked
  end)

  if ok and hl then
    local new_hl = { bg = "NONE" }
    if hl.fg then new_hl.fg = hl.fg end
    vim.api.nvim_set_hl(0, group, new_hl)
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

    -- Borders
    "TelescopeBorder",
    "TelescopePromptBorder",
    "TelescopeResultsBorder",
    "TelescopePreviewBorder",

    -- Titles above each section
    "TelescopePromptTitle",
    "TelescopeResultsTitle",
    "TelescopePreviewTitle",

    -- The ">" prompt prefix symbol
    "TelescopePromptPrefix",
}

for _, group in ipairs(ui_groups) do
  make_transparent(group)
end
