local M = {}

M.config = {
    keymap_direct = "<leader>sd",
    keymap_normal = "<leader>sq",
}

function get_visual_selection()
  return table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")), "\n")
end

local function run_is_fast(direct_mode)
    local text = get_visual_selection()
    if not text or text == "" then
        vim.notify("No text selected!", vim.log.levels.WARN)
        return
    end

    local cmd = direct_mode and "is-fast --color=never --direct " .. vim.fn.shellescape(text)
                           or "is-fast --color=never " .. vim.fn.shellescape(text)
    vim.notify("Running command: " .. cmd, vim.log.levels.INFO)

    local handle = io.popen(cmd)
    if not handle then
        vim.notify("Failed to execute command: " .. cmd, vim.log.levels.ERROR)
        return
    end

    local result = handle:read("*a")
    handle:close()

    if not result or result == "" then
        vim.notify("is-fast returned empty output!", vim.log.levels.WARN)
        return
    end

    vim.cmd("vnew")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(result:gsub("\r\n", "\n"), "\n"))
    vim.api.nvim_buf_set_option(0, "buftype", "nofile")
    vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(0, "swapfile", false)
end

M.run_is_fast_direct = function()
    run_is_fast(true)
end

M.run_is_fast_normal = function()
    run_is_fast(false)
end

M.setup = function(user_config)
    M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

    -- Set up the keymaps if configured
    if M.config.keymap_normal then
        vim.keymap.set("v", M.config.keymap_normal, M.run_is_fast_normal, {
            noremap = true,
            silent = true,
            desc = "Run selected text through is-fast",
        })
    end

    if M.config.keymap_direct then
        vim.keymap.set("v", M.config.keymap_direct, M.run_is_fast_direct, {
            noremap = true,
            silent = true,
            desc = "Run selected text through is-fast (direct mode)",
        })
    end
end

return M
