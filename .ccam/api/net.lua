function downloadFile(url, file_path)
	local handle, err = http.get(url)
	if not handle then
		io.stderr:write("Error: " .. err)
		return
	end
	
	local file = fs.open(file_path, 'w')
	file.write(handle.readAll())
	handle.close()
	file.close()
end