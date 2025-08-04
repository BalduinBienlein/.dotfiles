local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
local function make_transparent(group)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if ok then
    vim.api.nvim_set_hl(0, group, { fg = hl.fg, bg = "NONE" })
  end
end

local transparent_groups = {
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

for _, group in ipairs(transparent_groups) do
  make_transparent(group)
end
