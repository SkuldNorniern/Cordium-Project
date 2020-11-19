#pragma once
#include "Core.h"
namespace Cordium
{
	class CORDIUM_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};
	//define client
	Application* CreateApplication();
}
