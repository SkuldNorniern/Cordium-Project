workspace "Cordium"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
project "Cordium"
	location "Cordium"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name)")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name)")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/Modules\spdlog\include;"
	}

	filter"system:windows"
		cppdialect "C++17"
		staticruntime "On"
		ststemversion "latest"

		defines
		{
			"CM_PLATFORM_WINDOWS",
			"CM_BUILD_DLL"	
		}

		postbuildcommands
		{
			("{COPY}%{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sample")
		}
		
	filter"configurations:Debug"
		defines "CM_DEBUG"
		symbols "On"
	filter"configurations:Release"
		defines "CM_RELEASE"
		symbols "On"

	filter"configurations:Dist"
		defines "CM_DIST"
		symbols "On"

	filter ("system:windows","configurations:Release")
		buildoptions "/MT"

project "Sample"
	location "Sample"
	kind "ConsoleApp"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name)")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name)")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/Modules\spdlog\include;"
		"Cordium/src"
	}

	links
	{
		"Cordium"
	}
	filter"system:windows"
		cppdialect "C++17"
		staticruntime "On"
		ststemversion "latest"

		defines
		{
			"CM_PLATFORM_WINDOWS"
		}
		
	filter"configurations:Debug"
		defines "CM_DEBUG"
		symbols "On"
	filter"configurations:Release"
		defines "CM_RELEASE"
		symbols "On"

	filter"configurations:Dist"
		defines "CM_DIST"
		symbols "On"

	filter ("system:windows","configurations:Release")
		buildoptions "/MT"
