local M = {}

local function get_visual_selection()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    local start_line, start_col = start_pos[2] - 1, start_pos[3] - 1  -- Convert to 0-based indexing
    local end_line, end_col = end_pos[2] - 1, end_pos[3]  -- `end_col` is exclusive

    local text = vim.api.nvim_buf_get_text(0, start_line, start_col, end_line, end_col, {})
    return table.concat(text, "\n")
end


M.run_is_fast = function()
    local text = get_visual_selection()
    if not text then return end
    local cmd = "is-fast --direct " .. vim.fn.shellescape(text)
    vim.notify("Running command: " .. cmd, vim.log.levels.INFO)

    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()

    if not result or result == "" then
        vim.notify("is-fast returned empty output!", vim.log.levels.WARN)
        return
    end
    vim.cmd("vnew")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(result, "\n"))
end

vim.api.nvim_set_keymap("v", "<leader>s", ":lua require('is-fast').run_is_fast()<CR>", { noremap = true, silent = true })

return M

