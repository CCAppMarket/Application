--[[ Load CCAM configuration file ]]--
_G["CCAM_CONF"] = {}

local conf = loadfile("/.ccam/config.cfg")
setfenv(conf, CCAM_CONF)
conf()

--[[ Load libraries into tables ]]--
-- List libraries
local libraries = fs.list(CCAM_CONF.LIB_DIR)

for _, v in pairs(libraries) do
	-- Remove extension for table name
	local table_name = v:sub(1, v:find(".lua") - 1)

	-- Load library into table
	_G[table_name] = {}
	local lib = loadfile(CCAM_CONF.LIB_DIR .. v)
	setfenv(lib, setmetatable( _G[table_name], { __index = _G } ))
	lib()
end


--[[ Add bin directory to shell path ]]--
shell.setPath(shell.path() .. ":" .. CCAM_CONF.BIN_DIR)