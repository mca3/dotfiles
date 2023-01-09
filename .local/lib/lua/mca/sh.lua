local format = string.format

local M = {}

function M.escape(arg)
	if type(arg) ~= "string" then
		return arg
	end

	local s = format("%q", arg):gsub("([`$])", function(c)
		return "\\" .. c
	end)

	return s
end

function M.execute(...)
	local buf = {}

	for i=1,select("#", ...) do
		buf[i] = M.escape(select(i, ...))
	end

	return os.execute(table.concat(buf, " "))
end

return M
