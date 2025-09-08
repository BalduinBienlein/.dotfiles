vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { buffer = true })
        vim.keymap.set("n", "<leader>c", function()
            vim.cmd("normal! 1z=")
        end, { buffer = true })

        vim.opt_local.spell = true
        vim.opt_local.wrapmargin = 10
        vim.opt.tabstop = 4
    end,
})
