function versionStr(version_table)
	return version_table.major .. "."
		.. version_table.minor .. "-"
		.. version_table.build
end