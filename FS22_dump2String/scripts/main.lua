Dump = {}

local modDir = g_currentModDirectory

function Dump:loadMap(filename)
	local toDump = _G["pdlc_goeweilPack"].RotationAnimationSpikesExtended.load

	local binary = string.dump(toDump)
	local formatted_binary = ""
	local dec = ""

	for i = 1, string.len(binary, true) do
		dec, _ = ("\\%3d"):format(binary:sub(i, i):byte()):gsub(" ", "0")
		formatted_binary = formatted_binary..dec
	end

	local f = io.open(modDir .. "dump/dump", "w")
	f:write(tostring(formatted_binary))
	f:close()
end

addModEventListener(Dump)