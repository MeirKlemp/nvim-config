-- commands to set the binary to debug
vim.cmd [[
    command! -complete=file -nargs=* DebugC lua require"nv-dap.c-cpp-rust".start_c_debugger({<f-args>}, "gdb")
]]
vim.cmd [[
    command! -complete=file -nargs=* DebugRust lua require"nv-dap.c-cpp-rust".start_c_debugger({<f-args>}, "gdb", "rust-gdb")
]]

require"dap".adapters.cpp = {
    type = "executable",
    attach = {
        pidProperty = "pid",
        pidSelect = "ask",
    },
    command = "lldb-vscode",
    env = {
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb",
}


local M = {}
local last_gdb_config

M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
    if args and #args > 0 then
	last_gdb_config = {
	    type = "cpp",
	    name = args[1],
	    request = "launch",
	    program = table.remove(args, 1),
	    args = args,
	    cwd = vim.fn.getcwd(),
	    env = {},
	    externalConsole = true,
	    MIMode = mi_mode or "gdb",
	    MIDebuggerPath = mi_debugger_path,
	}
    end

    if not last_gdb_config then
	print("No binary to debug set! Use \":DebugC <binary> <args>\" or \":DebugRust <binary> <args>\"")
	return
    end

    local dap = require"dap"
    dap.run(last_gdb_config)
    dap.repl.open()
end

return M
