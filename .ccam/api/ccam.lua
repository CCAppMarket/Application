function downloadApp(app_name)
	-- Check if app already exists
	if appExists(app_name) then
		printError("Error: App already exists\nUse option 'update' to update the app")
		return false
	end

	-- Download files

	-- Create bin shortcut
end

function removeApp(app_name)
	-- Check that app exists
	if not appExists(app_name) then
		printError("Error: App doesn't exist")
		return false
	end

	-- Remove the app

end

function updateApp(app_name)
	-- Check that app exists
	if not appExists(app_name) then
		printError("Error: App doesn't exist")
		return false
	end

	-- Update the app

end

function checkForUpdate(app_name)
	-- Check that app exists
	if not appExists(app_name) then
		printError("Error: App doesn't exist")
		return false
	end

	-- Check current version
	local cur_build = getAppVersion(app_name).build
	print("Current build: " .. cur_build)

	-- Check remote version
	net.downloadFile(CCAM_CONF.APP_REPO .. app_name .. CCAM_CONF.APP_CONF, CCAM_CONF.TMP_DIR .. app_name .. "_conf.cfg")
	local file = fs.open(CCAM_CONF.TMP_DIR .. app_name .. "_conf.cfg", 'r')
	new_build = json.decode(file.readAll()).version.build
	print("Newest build: " .. new_build)

	-- If there's an update return true
	return new_build > cur_build and true or false
end

function getAppVersion(app_name)
	local app_json_file = fs.open(CCAM_CONF.APP_DIR .. app_name .. CCAM_CONF.APP_CONF, 'r')

	-- Decode JSON
	local data = json.decode(app_json_file.readAll())


	app_json_file.close()

	-- Return version
	return data.version
end

function appExists(app_name)
	return fs.exists(CCAM_CONF.APP_DIR .. app_name .. CCAM_CONF.APP_MAIN)
end