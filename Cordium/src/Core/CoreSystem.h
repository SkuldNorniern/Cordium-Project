#pragma once

#include "Core/Core.h"

namespace Cordium
{ 
	namespace Internal 
	{
	// Low-level System operations
	class CD_EXPORT CoreSystem
	{
	public:
		static void Init(bool enableProfiler = true);
		static void Shutdown();
	};

} 

};