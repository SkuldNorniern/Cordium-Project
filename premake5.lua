/include "./Modules/premake/premake-config/solution_items.lua"

workspace "Cordium"
    architecture "x64"
    location "build"
    startproject "Editor"

  	configurations
  	{
  	  	"Debug",
  	    "Release",
  	    "Dist"
  	}

    solution_items
  	{
  		".editorconfig"
  	}

    flags
    {
        "MultiProcessorCompile"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}

group "Modules"
    include "Modules/premake"
group ""

include "Cordium"
include "Editor"
include "Sample"
