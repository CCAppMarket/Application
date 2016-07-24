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

	-- Check remote version

	-- If there's an update return true

end

function getAppVersion(app_name)
	local app_json_file = fs.open(CCAM_CONF.APP_DIR .. app_name .. CCAM_CONF.APP_CONF, 'r')

	-- Decode JSON

	app_json_file.close()

	-- Return version
	
end

function appExists(app_name)
	return fs.exists(CCAM_CONF.APP_DIR .. app_name)
end