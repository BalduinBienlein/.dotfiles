local run_term_win = nil
local run_term_buf = nil
local terminal_job_id = nil

vim.keymap.set("n", "<leader>r", function()
    local current_win = vim.api.nvim_get_current_win()
    if vim.bo.modified then vim.cmd("write") end

    local file_path = vim.fn.expand("%:p")
    local ext = vim.fn.expand("%:e")
    local file_name = vim.fn.expand("%:t")
    local name_no_ext = vim.fn.expand("%:t:r")
    local dir = vim.fn.expand("%:p:h")

    local cmd
    if ext == "c" then
        cmd = string.format("gcc %s -o %s && ./%s", file_name, name_no_ext, name_no_ext)
    elseif ext == "cpp" or ext == "cc" or ext == "cxx" then
        cmd = string.format("g++ %s -o %s && ./%s", file_name, name_no_ext, name_no_ext)
    elseif ext == "py" then
        cmd = string.format("python %s", file_name)
    elseif ext == "" then
        cmd = string.format("bash %s", file_name)
    else
        vim.notify("Unsupported filetype: " .. ext, vim.log.levels.WARN)
        return
    end

    vim.cmd("cd " .. dir)

    -- Helper to start terminal
    local function start_terminal()
        vim.cmd("botright split")
        vim.cmd("resize 15")
        vim.cmd("terminal")
        run_term_buf = vim.api.nvim_get_current_buf()
        run_term_win = vim.api.nvim_get_current_win()
        terminal_job_id = vim.b.terminal_job_id
        vim.fn.chansend(terminal_job_id, "clear && " .. cmd .. "\n")
    end

    -- Reuse existing terminal
    if run_term_buf and vim.api.nvim_buf_is_valid(run_term_buf) then
        local ok, job = pcall(vim.api.nvim_buf_get_var, run_term_buf, "terminal_job_id")
        if ok and vim.fn.jobwait({ job }, 0)[1] == -1 then
            -- Terminal still running
            if run_term_win and vim.api.nvim_win_is_valid(run_term_win) then
                vim.api.nvim_set_current_win(run_term_win)
            else
                vim.cmd("botright split")
                vim.cmd("resize 15")
                run_term_win = vim.api.nvim_get_current_win()
            end

            -- vim.fn.chansend(job, "\x03") -- Ctrl+C
            vim.fn.chansend(job, "clear && " .. cmd .. "\n")
        else
            -- Terminal exited, reuse buffer
            vim.cmd("botright split")
            vim.cmd("resize 15")
            vim.api.nvim_set_current_buf(run_term_buf)
            vim.cmd("terminal")
            run_term_buf = vim.api.nvim_get_current_buf()
            run_term_win = vim.api.nvim_get_current_win()
            terminal_job_id = vim.b.terminal_job_id
            vim.fn.chansend(terminal_job_id, "clear && " .. cmd .. "\n")
        end
    else
        start_terminal()
    end
    vim.api.nvim_set_current_win(current_win)
end, { desc = "Compile and run current file in terminal" })
vim.keymap.set("n", "<leader>q", function()
    local current_win = vim.api.nvim_get_current_win()

    if run_term_win and vim.api.nvim_win_is_valid(run_term_win) then
        vim.api.nvim_win_close(run_term_win, true)
        run_term_win = nil
        run_term_buf = nil
    end

    vim.api.nvim_set_current_win(current_win)
end, { desc = "Close the run terminal and stay in current buffer" })
