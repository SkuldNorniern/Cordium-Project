IncludeDir = {}
IncludeDir["stb"] = "../Cordium/Modules/stb/"
IncludeDir["Cordium"] = "../Cordium/src"
IncludeDir["Modules"] = "../Cordium/Modules/"
IncludeDir["spdlog"] = "../Cordium/Modules/spdlog/include"

project "Editor"
	kind "WindowedApp"
	language "C++"

	files
	{
		"**.h",
		"**.cpp",
		"Scenes/**.h",
		"Scenes/**.cpp"
	}

	sysincludedirs
	{
		"%{IncludeDir.stb}",
		"%{IncludeDir.Mouless}",
		"%{IncludeDir.spdlog}",
		"%{IncludeDir.Cordium}",
	}

	links
	{
		"Cordium",
    }
}

defines
{
	"CD_PROFILE",
	"TRACE_ENABLE",
}

	filter { "files:Modules/**"}
		warnings "Off"

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		entrypoint "WinMainCRTStartup"

		defines
		{
			"CDP_WINDOWS",
			"CDR_API_OPENGL",
			"CDR_API_VULKAN",
			"VK_USE_PLATFORM_WIN32_KHR",
			"WIN32_LEAN_AND_MEAN",
			"_CRT_SECURE_NO_WARNINGS",
			"_DISABLE_EXTENDED_ALIGNED_STORAGE",
			"_SILENCE_CXX17_ITERATOR_BASE_CLASS_DEPRECATION_WARNING",
			"CDR_DIR="  .. root_dir,
			"CD_VOLK",
	"CD_SSE",
		}

		libdirs
		{
			"../Cordium/Modules/OpenAL/libs/Win32"
		}

		links
		{
			"glfw",
			"OpenGL32",
			"OpenAL32"
		}

		buildoptions
		{
			"/MP"
		}

		disablewarnings { 4307 }

	filter "system:macosx"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		editandcontinue "Off"

xcodebuildresources { "Images.xcassets", "libMoltenVK.dylib" }

		xcodebuildsettings
		{
			['ARCHS'] = false,
			['CODE_SIGN_IDENTITY'] = 'Mac Developer',
			['PRODUCT_BUNDLE_IDENTIFIER'] = 'com.skuldnorniern',
			['DEVELOPMENT_TEAM'] = 'C5L4T5BF6L',
			['INFOPLIST_FILE'] = '../Cordium/src/Platform/macOS/Info.plist',
			['ASSETCATALOG_COMPILER_APPICON_NAME'] = 'AppIcon'
			--['ENABLE_HARDENED_RUNTIME'] = 'YES'
		}

		defines
		{
			"CDP_MACOS",
			"CDP_UNIX",
			"CDR_API_OPENGL",
			"CDR_API_VULKAN",
			"VK_EXT_metal_surface",
			"CD_IMGUI",
			"CDR_DIR="  .. root_dir,
			"CD_VOLK",
			"CD_SSE"
		}

		linkoptions
		{
			"-framework OpenGL",
			"-framework Cocoa",
			"-framework IOKit",
			"-framework CoreVideo",
			"-framework OpenAL",
			"-framework QuartzCore"
		}

		files
		{
        	"../Resources/MacOSIcons/Images.xcassets",
        	"../Cordium/Modules/vulkan/libs/macOS/libMoltenVK.dylib"
		}

		links
		{
			"glfw",
		}

		SetRecommendedXcodeSettings()

	filter "system:ios"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		kind "WindowedApp"
		targetextension ".app"
		editandcontinue "Off"

		defines
		{
			"CDP_IOS",
			"CDP_MOBILE",
			"CDP_UNIX",
			"CDR_API_VULKAN",
			"VK_USE_PLATFORM_IOS_MVK",
			"CD_IMGUI"
		}

		links
		{
			"QuartzCore.framework",
			"Metal.framework",
            "MetalKit.framework",
        	"IOKit.framework",
        	"CoreFoundation.framework",
			"CoreVideo.framework",
			"CoreGraphics.framework",
			"UIKit.framework",
			"OpenAL.framework",
			"AudioToolbox.framework",
			"Foundation.framework",
			"SystemConfiguration.framework",
		}

		linkoptions
		{
			"../Cordium/Modules/vulkan/libs/iOS/libMoltenVK.a"
		}

		files
		{
			"../Resources/IOSIcons/Images.xcassets",
	        "../Cordium/res/EngineShaders",
        	"../Cordium/src/Platform/iOS/Client/**",
            "res/scenes",
            "res/scripts",
            "res/meshes",
            "res/sounds",
            "res/textures",
        	"Editor.lmproj",
        	"Launch Screen.storyboard"
		}

		xcodebuildsettings
		{
			['ARCHS'] = '$(ARCHS_STANDARD)',
			['ONLY_ACTIVE_ARCH'] = 'NO',
			['SDKROOT'] = 'iphoneos',
			['TARGETED_DEVICE_FAMILY'] = '1,2',
			['SUPPORTED_PLATFORMS'] = 'iphonesimulator iphoneos',
			['CODE_SIGN_IDENTITY[sdk=iphoneos*]'] = 'iPhone Developer',
			['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1',
			['PRODUCT_BUNDLE_IDENTIFIER'] = 'com.skuldnorniern',
			['DEVELOPMENT_TEAM'] = 'C5L4T5BF6L',
			['INFOPLIST_FILE'] = '../Cordium/src/Platform/iOS/Client/Info.plist',
			['ASSETCATALOG_COMPILER_APPICON_NAME'] = 'AppIcon',
		}

		if _OPTIONS["teamid"] then
			xcodebuildsettings {
				["DEVELOPMENT_TEAM"] = _OPTIONS["teamid"]
			}
		end

		linkoptions { "-rpath @executable_path/Frameworks" }

		excludes
		{
			("**.DS_Store")
		}

		xcodebuildresources
		{
			"../Cordium/src/Platform/iOS/Client",
			"Images.xcassets",
            "EngineShaders",
            "meshes",
            "scenes",
            "scripts",
            "sounds",
            "textures",
            "Editor.lmproj"
		}
		SetRecommendedXcodeSettings()

	filter "system:linux"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"CDP_LINUX",
			"CDP_UNIX",
			"CDR_API_OPENGL",
			"CDR_API_VULKAN",
			"VK_USE_PLATFORM_XCB_KHR",
			"CD_IMGUI",
			"CDR_DIR="  .. root_dir,
			"CD_VOLK"
		}

		buildoptions
		{
			"-fpermissive",
			"-Wattributes",
			"-fPIC",
			"-Wignored-attributes",
			"-Wno-psabi"
		}

		links
		{
			"glfw",
		}

		links { "X11", "pthread", "dl", "atomic", "stdc++fs"}

		linkoptions { "-L%{cfg.targetdir}", "-Wl,-rpath=\\$$ORIGIN" }

		if _OPTIONS["arch"] ~= "arm" then
			buildoptions
			{
				"-msse4.1",
			}

			defines { "CD_SSE" ,"USE_VMA_ALLOCATOR"}
		end

	filter "configurations:Debug"
		defines "CD_DEBUG"
		optimize "Off"
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
