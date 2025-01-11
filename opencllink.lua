function LinkOpenCL()
	-- Get the location of the current script file
    local scriptLocation = debug.getinfo(1, "S").source:sub(2)

    -- Determine the relative directory based on the current script location
    local relativeDir = path.getdirectory(scriptLocation)

	filter "configurations:Debug"
		includedirs
		{
			relativeDir .. "/include",
		}
		links
		{
			"OpenCL.lib",
			"OpenCLExt.lib",
			"OpenCLUtilsd.lib",
			"OpenCLUtilsCppd.lib"
		}
		libdirs
		{
			relativeDir .. "/lib"
		}
		postbuildcommands
		{
			"{COPY} " .. '"' .. relativeDir .. "/bin/" .. '"' .. " %{cfg.targetdir}"
		}
	filter "configurations:Release"
		includedirs
		{
			relativeDir .. "/include",
		}
		links
		{
			"OpenCL.lib",
			"OpenCLExt.lib",
			"OpenCLUtils.lib",
			"OpenCLUtilsCpp.lib"
		}
		libdirs
		{
			relativeDir .. "/lib"
		}
		postbuildcommands
		{
			"{COPY} " .. '"' .. relativeDir .. "/bin/" .. '"' .. " %{cfg.targetdir}"
		}
	filter "configurations:Dist"
		includedirs
		{
			relativeDir .. "/include",
		}
		links
		{
			"OpenCL.lib",
			"OpenCLExt.lib",
			"OpenCLUtils.lib",
			"OpenCLUtilsCpp.lib"
		}
		libdirs
		{
			relativeDir .. "/lib"
		}
		postbuildcommands
		{
			"{COPY} " .. '"' .. relativeDir .. "/bin/*.dll" .. '"' .. " %{cfg.targetdir}"
		}
end