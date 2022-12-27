-- Constants
local bat = "BAT0"

-- Helper to read a part of a file, or all of one
local function read(path, mode)
	local h = assert(io.open(path, "r"))
	local r = h:read(mode or "*a")
	h:close()
	return r
end

-- Caches response for t seconds.
local function once_every(t, fn)
	local last = 0
	local res
	return function(...)
		if os.time() > last + t then
			res = {fn(...)}
			last = os.time()
		end
		return table.unpack(res)
	end
end

-- Returns the battery percentage with a + indicating charging.
local function battery()
	local b = read(string.format("/sys/class/power_supply/%s/capacity", bat), "*n")
	local s = read(string.format("/sys/class/power_supply/%s/status", bat), "*n")
	return string.format("%d%%%s", b, s == "Charging" and "+" or "")
end

-- Simple time/date widget, returning in the form of Dec 27 15:27
local function time()
	return os.date("%b %d %H:%M")
end

-- Declare blocks here in the order you want to see them, left-to-right
return {
	once_every(180, battery),
	time
}
