-- fetch the dap plugin
local dap = require("dap")
-- Setup DapUI
local dapui = require("dapui")
-- set it up see more configs in their repo
dapui.setup()

-- dap fires events, we can listen on them to open UI on certain events
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

vim.fn.sign_define("DapBreakpoint", { text = "*", texthl = "yellow", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = ">", texthl = "green", linehl = "", numhl = "" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
-- vim.fn.sign_define('DapBreakpointCondition', { text='•', texthl='blue',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpointRejected',  { text='•', texthl='orange', linehl='DapBreakpoint', numhl='DapBreakpoint' })
--vim.fn.sign_define("DapStopped", { text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
--vim.fn.sign_define('DapLogPoint',            { text='•', texthl='yellow', linehl='DapBreakpoint', numhl='DapBreakpoint' })

local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)
