---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>qq"] = { "<cmd>qa<cr>", "Quit all" },
  },
}

M.moveline = {
  n = {
    ["<A-j>"] = { ":m .+1<CR>==" },
    ["<A-k>"] = { ":m .-2<CR>==" },
  },

  i = {
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi" },
  },

  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv" },
  },
}
-- more keybinds!
-- vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

return M
