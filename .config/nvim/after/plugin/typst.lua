vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { buffer = true })
        vim.keymap.set("n", "<leader>c", function()
            vim.cmd("normal! 1z=")
        end, { buffer = true })

        vim.opt_local.spell = true
        vim.opt_local.wrapmargin = 10

        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})

require('typst-preview').setup({
    get_root = function(path)
        local env = os.getenv("TYPST_ROOT")
        if env and env ~= "" then
            return vim.fn.expand(env)
        end
        return vim.fn.fnamemodify(path, ':p:h')
    end,
})

vim.api.nvim_create_user_command('EditFig', function()
  local figure_fname = vim.fn.expand('<cfile>')
  vim.fn.jobstart({ 'typst-figure', figure_fname }, { detach = true })
end, {})

vim.keymap.set('n', '<leader>td', ':EditFig<CR>', { noremap = true, silent = true })
