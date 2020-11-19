require 'Scripts/premake-ios'
require 'Scripts/premake-defines'
require 'Scripts/premake-common'

root_dir = os.getcwd()

workspace "Cordium"
    startproject "Editor"
    location "build"
	architecture "x64"
	Arch = ""

	if _OPTIONS["arch"] then
		Arch = _OPTIONS["arch"]
	else
		Arch = "x64"
	end

	if Arch == "arm" then 
		architecture "ARM"
	elseif Arch == "x64" then 
		architecture "x86_64"
	elseif Arch == "x86" then
		architecture "x86"
	end

	print("Arch = ", Arch)
	configurations
	{
	  	"Debug",
	    "Release",
	    "Dist"
	}
    flags
    {
        "MultiProcessorCompile"
    }
    
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    targetdir ("bin/%{outputdir}/")
    objdir ("bin-int/%{outputdir}/obj/")
    group "Modules"

		filter()
	group ""

	include "Cordium/premake5"
	include "Editor/premake5"

	filter()

