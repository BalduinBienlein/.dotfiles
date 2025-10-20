vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
require("oil").setup({
    view_options = {
        show_hidden = false,
    },
    keymaps = {
        ["g."] = "actions.toggle_hidden",
    },
})
