#!/usr/bin/env luajit

-- TODO: Implement without using ioctls or ffi

local ffi = require("ffi")

local TIOCGWINSZ = 0x5413
local STDOUT_FILENO = 1

ffi.cdef [[
int ioctl(int fd, unsigned long request, ...);

struct winsize {
	unsigned short ws_row;
	unsigned short ws_col;
	unsigned short ws_xpixel;
	unsigned short ws_ypixel;
};
]]

return {
	size = function()
		local ws = ffi.new("struct winsize[1]")
		ffi.C.ioctl(STDOUT_FILENO, TIOCGWINSZ, ws)

		return ws[0].ws_col, ws[0].ws_row
	end
}
