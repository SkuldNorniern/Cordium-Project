#pragma once

#ifdef CM_PLATFORM_WINDOWS
	#ifdef CM_BUILD_DLL
		#define CORDIUM_API __declspec(dllexport)
	#else
		#define CORDIUM_API __declspec(dllimport)
	#endif
#else
	#error Cordium Only Supporting Windows Currently
#endif 
