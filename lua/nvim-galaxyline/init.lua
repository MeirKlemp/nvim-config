-- theme by ChrisAtMachine
local colors = {
    bg = "#1E1E1E",
    section_bg = "#2E2E2E",
    yellow = "#DCDCAA",
    dark_yellow = "#D7BA7D",
    cyan = "#4EC9B0",
    green = "#608B4E",
    light_green = "#B5CEA8",
    string_orange = "#CE9178",
    orange = "#FF8800",
    purple = "#C586C0",
    magenta = "#D16D9E",
    grey = "#858585",
    blue = "#569CD6",
    vivid_blue = "#4FC1FF",
    light_blue = "#9CDCFE",
    red = "#D16969",
    error_red = "#F44747",
    info_yellow = "#FFCC66"
}

local get_mode_color = function()
    local mode_color = {
	n = colors.blue,
	i = colors.green,
	v = colors.purple,
	[''] = colors.purple,
	V = colors.purple,
	c = colors.magenta,
	no = colors.blue,
	s = colors.orange,
	S = colors.orange,
	[''] = colors.orange,
	ic = colors.yellow,
	R = colors.red,
	Rv = colors.red,
	cv = colors.blue,
	ce = colors.blue,
	r = colors.cyan,
	rm = colors.cyan,
	['r?'] = colors.cyan,
	['!'] = colors.blue,
	t = colors.blue
    }

    return mode_color[vim.fn.mode()]
end

local get_mode_alias = function()
    local mode_alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
	s = "SELECT",
	S = "SELECT",
	t = "TERMINAL",
    }

    return mode_alias[vim.fn.mode()]
end

local gl = require"galaxyline"
local sec = gl.section
local condition = require"galaxyline.condition"

gl.short_line_list = {"packer"}

---------------
-- Left Side --
---------------

sec.left[1] = {
    FirstLeftElement = {
	provider = function()
	    vim.cmd("hi GalaxyFirstLeftElement guifg=" .. get_mode_color())
	    return '▊ '
	end,
	highlight = {colors.red, colors.bg},
    }
}

sec.left[2] = {
    ViMode = {
	provider = function()
	    vim.cmd("hi GalaxyViMode guifg=" .. get_mode_color())
	    return get_mode_alias() .. ' '
	end,
	condition = condition.hide_in_width,
	separator = "  ",
	separator_highlight = {colors.bg, colors.section_bg},
	highlight = {colors.red, colors.bg},
    }
}
sec.left[3] = {
    ViModeShort = {
	provider = function()
	    vim.cmd("hi GalaxyViModeShort guifg=" .. get_mode_color())
	    local alias = get_mode_alias()
	    if alias == nil then
		return nil
	    end
	    return alias:sub(1,1) .. ' '
	end,
	condition = function() return not condition.hide_in_width() end,
	separator = "  ",
	separator_highlight = {colors.bg, colors.section_bg},
	highlight = {colors.red, colors.bg},
    }
}

sec.left[4] = {
    FileIcon = {
	provider = "FileIcon",
	highlight = {require"galaxyline.provider_fileinfo".get_file_icon_color, colors.section_bg},
    }
}
sec.left[5] = {
    FileName = {
	provider = "FileName",
	separator = "  ",
	separator_highlight = {colors.section_bg, colors.bg},
	highlight = {colors.grey, colors.section_bg},
    }
}

sec.left[6] = {
    GitIcon = {
	provider = function()
	    return ' '
	end,
	condition = condition.check_git_workspace,
	separator = ' ',
	separator_highlight = {"NONE", colors.bg},
	highlight = {colors.orange, colors.bg},
    }
}
sec.left[7] = {
    GitBranch = {
	provider = "GitBranch",
	condition = condition.check_get_workspace,
	separator = ' ',
	separator_highlight = {"NONE", colors.bg},
	highlight = {colors.grey, colors.bg},
    }
}

sec.left[8] = {
    DiffAdd = {
	provider = "DiffAdd",
	condition = condition.hide_in_width,
	icon = '  ',
	highlight = {colors.green, colors.bg},
    }
}
sec.left[9] = {
    DiffModified = {
	provider = "DiffModified",
	condition = condition.hide_in_width,
	icon = ' 柳 ',
	highlight = {colors.orange, colors.bg},
    }
}
sec.left[10] = {
    DiffRemove = {
	provider = "DiffRemove",
	condition = condition.hide_in_width,
	icon = '  ',
	highlight = {colors.red, colors.bg},
    }
}

----------------
-- Right Side --
----------------

sec.right[1] = {
    DiagnosticError = {
	provider = "DiagnosticError",
	icon = '  ',
	highlight = {colors.error_red, colors.bg}
    }
}
sec.right[2] = {
    DiagnosticWarn = {
	provider = "DiagnosticWarn",
	icon = '  ',
	highlight = {colors.orange, colors.bg}
    }
}
sec.right[3] = {
    DiagnosticHint = {
	provider = "DiagnosticHint",
	icon = '  ',
	highlight = {colors.vivid_blue, colors.bg}
    }
}
sec.right[4] = {
    DiagnosticInfo = {
	provider = "DiagnosticInfo",
	icon = '  ',
	highlight = {colors.info_yellow, colors.bg}
    }
}

sec.right[5] = {
    ShowLspClient = {
        provider = "GetLspClient",
        condition = function()
            local tbl = {["dashboard"] = true, [" "] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
	condition = condition.hide_in_width,
        icon = ' ',
        highlight = {colors.grey, colors.bg},
    }
}

sec.right[6] = {
    LineInfo = {
        provider = "LineColumn",
	separator = ' ▊',
	separator_highlight = {colors.section_bg, colors.bg},
        highlight = {colors.grey, colors.section_bg},
    }
}

sec.right[7] = {
    PerCent = {
        provider = "LinePercent",
        separator = ' | ',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.grey, colors.section_bg},
    }
}

sec.right[8] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        condition = condition.hide_in_width,
        separator = ' | ',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.grey, colors.section_bg},
    }
}

sec.right[9] = {
    FileEncode = {
        provider = "FileEncode",
        condition = condition.hide_in_width,
        separator = ' |',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.grey, colors.section_bg}
    }
}

sec.right[10] = {
    LastRightElement = {
	provider = function()
	    vim.cmd("hi GalaxyLastRightElement guifg=" .. get_mode_color())
	    return '  ▊'
	end,
	highlight = {colors.red, colors.section_bg},
    }
}

-----------------------
-- Short Status Line --
-----------------------

sec.short_line_left[1] = {
    BufferType = {
        provider = "FileTypeName",
        separator = ' | ',
        separator_highlight = {colors.grey, colors.section_bg},
        highlight = {colors.grey, colors.section_bg},
    }
}

sec.short_line_left[2] = {
    SFileName = {
	provider = "SFileName",
	condition = condition.buffer_not_empty,
	separator = "  ",
	separator_highlight = {colors.section_bg, colors.bg},
	highlight = {colors.grey, colors.section_bg},
    }
}

sec.short_line_right[1] = {
    BufferIcon = {
	provider = "BufferIcon",
	separator = ' ▊',
	separator_highlight = {colors.section_bg, colors.bg},
	highlight = {colors.grey, colors.section_bg},
    }
}
