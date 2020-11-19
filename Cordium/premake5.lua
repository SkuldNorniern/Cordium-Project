IncludeDir = {}
IncludeDir["Modules"] = "Modules/"
IncludeDir["Cordium"] = "src"
IncludeDir["spdlog"] = "Modules/spdlog/include"

project "Cordium"
    kind "StaticLib"
    language "C++"
    editandcontinue "Off"
    files
    {
        "src/**.h",
        "src/**.c",
        "src/**.cpp"
    }
    removefiles
    {
        "src/Platform/**"
    }
    includedirs
    {
        "../",
        "src/",
        "",
        "../src/"
    }
    sysincludeddirs
    {
        "%{IncludeDir.Modules}",
        "%{IncludeDir.spdlog}",
        "%{IncludeDir.Cordium}",
    }
    links
    {
    }
    defines
    {
        "CD_ENGINE",
        "CD_DYNAMIC",
        "CDR_DIR="  .. root_dir,
        "CD_PROFILE",
        "TRACE_ENABLE",
    }
filter "system:windows"
	cppdialect "C++17"
	staticruntime "on"
	systemversion "latest"

 	pchheader "Precompiled.h"
	pchsource "src/Precompiled.cpp"

	defines
	{
		"CDP_WINDOWS",
		"CDR_API_OPENGL",
		"CDR_API_VULKAN",
		"VK_USE_PLATFORM_WIN32_KHR",
		"WIN32_LEAN_AND_MEAN",
		"_CRT_SECURE_NO_WARNINGS",
		"_DISABLE_EXTENDED_ALIGNED_STORAGE",
		"_SILENCE_CXX17_OLD_ALLOCATOR_MEMBERS_DEPRECATION_WARNING",
    	"_SILENCE_CXX17_ITERATOR_BASE_CLASS_DEPRECATION_WARNING",
		"CD_IMGUI",
		"CD_OPENAL",
		"CD_VOLK",
		"USE_VMA_ALLOCATOR",
		"CD_SSE"
	}

	files
	{
		"src/Platform/Windows/*.h",
		"src/Platform/Windows/*.cpp",

		"src/Platform/GLFW/*.h",
		"src/Platform/GLFW/*.cpp",

		"src/Platform/OpenAL/*.h",
		"src/Platform/OpenAL/*.cpp",

		"src/Platform/OpenGL/*.h",
		"src/Platform/OpenGL/*.cpp",

		"src/Platform/Vulkan/*.h",
		"src/Platform/Vulkan/*.cpp",

		"Module/glad/src/glad_wgl.c"
	}

	links
	{
		"glfw",
	}

	buildoptions
	{
		"/MP", "/bigobj"
	}
	disablewarnings { 4307 }

	characterset ("MBCS")

 	filter 'files:Modules/**.cpp'
		flags  { 'NoPCH' }
	filter 'files:Modules/**.c'
		flags  { 'NoPCH' }

filter "system:macosx"
	cppdialect "C++17"
	systemversion "latest"

	files
	{
		"src/Platform/macOS/*.mm",
		"src/Platform/macOS/*.h",
		"src/Platform/macOS/*.cpp",

		"src/Platform/Unix/*.h",
		"src/Platform/Unix/*.cpp",

  		"src/Platform/GLFW/*.h",
		"src/Platform/GLFW/*.cpp",

		"src/Platform/OpenAL/*.h",
		"src/Platform/OpenAL/*.cpp",

  		"src/Platform/OpenGL/*.h",
		"src/Platform/OpenGL/*.cpp",

  		"src/Platform/Vulkan/*.h",
		"src/Platform/Vulkan/*.cpp"
	}

	defines
	{
		"CDP_MACOS",
		"CDP_UNIX",
		"CDR_API_OPENGL",
		"CDR_API_VULKAN",
		"VK_USE_PLATFORM_METAL_EXT",
		"CD_IMGUI",
		"CD_OPENAL",
		"CD_VOLK",
		"USE_VMA_ALLOCATOR",
		"CD_SSE"
	}

	links
	{
		"QuartzCore.framework",
		"Metal.framework",
		"Cocoa.framework",
       	"IOKit.framework",
       	"CoreFoundation.framework",
		"CoreVideo.framework",
		"OpenAL.framework",
		"SystemConfiguration.framework",
		"glfw"
	}

	libdirs
	{
		"../bin/**"
	}

	buildoptions
	{
		"-Wno-attributes",
    	"-Wno-nullability-completeness",
	    "-fdiagnostics-absolute-paths"
	}
 
	SetRecommendedXcodeSettings()

pchheader "../Cordium/src/Precompiled.h"
pchsource "../Cordium/src/Precompiled.cpp"

 	filter 'files:Modules/**.cpp'
		flags  { 'NoPCH' }
	filter 'files:Modules/**.c'
		flags  { 'NoPCH' }
	filter 'files:src/**.m'
		flags  { 'NoPCH' }
	filter 'files:src/**.mm'
		flags  { 'NoPCH' }

 filter "system:ios"
	cppdialect "C++17"
	systemversion "latest"
	kind "StaticLib"

	defines
	{
		"CDP_IOS",
		"CDP_MOBILE",
		"CDP_UNIX",
		"CDR_API_VULKAN",
		"VK_USE_PLATFORM_IOS_MVK",
		"CD_IMGUI",
		"USE_VMA_ALLOCATOR",
		"CD_OPENAL"
	}

	files
	{
		"src/Platform/iOS/*.mm",
		"src/Platform/iOS/*.h",
		"src/Platform/iOS/*.cpp",

		"src/Platform/OpenAL/*.h",
		"src/Platform/OpenAL/*.cpp",

		"src/Platform/Unix/*.h",
		"src/Platform/Unix/*.cpp",

  		"src/Platform/Vulkan/*.h",
		"src/Platform/Vulkan/*.cpp"
	}

	removefiles
	{
		"src/Platform/Unix/UnixFileSystem.cpp"
	}

	links
	{
		"QuartzCore.framework",
		"Metal.framework",
       	"IOKit.framework",
       	"CoreFoundation.framework",
		"CoreVideo.framework",
		"OpenAL.framework"
	}

	libdirs
	{
		"../bin/**"
	}

	buildoptions
	{
		"-Wno-attributes",
		"-Wno-nullability-completeness"
	}

	SetRecommendedXcodeSettings()

filter "system:linux"
	cppdialect "C++17"
	systemversion "latest"

	defines
	{
		"CDP_LINUX",
		"CDP_UNIX",
		"CDR_API_OPENGL",
		"CDR_API_VULKAN",
		"VK_USE_PLATFORM_XCB_KHR",
		"CD_IMGUI",
		"CD_VOLK"
	}

  	files
	{
		"src/Platform/Unix/*.h",
		"src/Platform/Unix/*.cpp",

   		"src/Platform/GLFW/*.h",
		"src/Platform/GLFW/*.cpp",

		"src/Platform/OpenAL/*.h",
		"src/Platform/OpenAL/*.cpp",

		"src/Platform/OpenGL/*.h",
		"src/Platform/OpenGL/*.cpp",

		"src/Platform/Vulkan/*.h",
		"src/Platform/Vulkan/*.cpp"
	}

	links
	{
		"glfw"
	}

	linkoptions
	{
		"Modules/OpenAL/libs/linux/libopenal.so"
	}

	linkoptions{ "-Wl,-rpath=\\$$ORIGIN" }

	libdirs
	{
		"../bin/**"
	}

	buildoptions
	{
		"-fpermissive",
		"-fPIC",
		"-Wignored-attributes",
		"-Wno-psabi"
	}

	links { "X11", "pthread"}

 	pchheader "../Cordium/src/Precompiled.h"
	pchsource "../Cordium/src/Precompiled.cpp"

	filter 'files:Modules/**.cpp'
		flags  { 'NoPCH' }
	filter 'files:Modules/**.c'
		flags  { 'NoPCH' }
	filter 'files:src/**.c'
		flags  { 'NoPCH' }

	if _OPTIONS["arch"] ~= "arm" then
		buildoptions
		{
			"-msse4.1",
		}

		defines { "CD_SSE" ,"USE_VMA_ALLOCATOR"}
	end
 
filter "system:cordium"
	cppdialect "C++17"
	systemversion "latest"

	defines
	{
		"CDP_CORDIUM",
		"CDR_API_OPENGL",
		"CDR_API_VULKAN",
		"VK_USE_PLATFORM_XCB_KHR",
		"CD_IMGUI",
		"CD_VOLK"
	}

  	files
	{
		"src/Platform/Unix/*.h",
		"src/Platform/Unix/*.cpp",

   		"src/Platform/GLFW/*.h",
		"src/Platform/GLFW/*.cpp",

		"src/Platform/OpenAL/*.h",
		"src/Platform/OpenAL/*.cpp",

		"src/Platform/OpenGL/*.h",
		"src/Platform/OpenGL/*.cpp",

		"src/Platform/Vulkan/*.h",
		"src/Platform/Vulkan/*.cpp"
	}

	links
	{
		"glfw"
	}

	linkoptions
	{
	}

	linkoptions{ "-Wl,-rpath=\\$$ORIGIN" }

	libdirs
	{
		"../bin/**"
	}

	buildoptions
	{
		"-fpermissive",
		"-fPIC",
		"-Wignored-attributes",
		"-Wno-psabi"
	}

	links { "X11", "pthread"}

 	pchheader "../Cordium/src/Precompiled.h"
	pchsource "../Cordium/src/Precompiled.cpp"

	filter 'files:Modules/**.cpp'
		flags  { 'NoPCH' }
	filter 'files:Modules/**.c'
		flags  { 'NoPCH' }
	filter 'files:src/**.c'
		flags  { 'NoPCH' }

	if _OPTIONS["arch"] ~= "arm" then
		buildoptions
		{
			"-msse4.1",
		}

		defines { "CD_SSE" ,"USE_VMA_ALLOCATOR"}
	end

filter "configurations:Debug"
	defines { "CD_DEBUG", "_DEBUG" }
	symbols "On"
	runtime "Debug"

filter "configurations:Release"
	defines "CD_RELEASE"
	optimize "On"
	symbols "On"
	runtime "Release"

filter "configurations:Production"
	defines "CD_PRODUCTION"
	symbols "Off"
	optimize "Full"
	runtime "Release"
    
    
    
    
    
    
    
    