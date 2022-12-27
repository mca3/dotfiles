return function(name)
	name = name or "selected"

	local h, err = io.open(os.getenv("HOME") .. "/.config/theme/" .. name)
	if not h then
		return nil, err
	end

	local out = {}

	local l = h:read("*l")
	while l do
		if #l > 0 then
			local k, v = string.match(l, "(%w+)=(%w+)")
			out[k] = v
		end

		l = h:read("*l")
	end
	h:close()

	return out
end
