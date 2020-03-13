#pragma once
#ifdef CM_PLATFORM_WINDOWS

extern Cordium::Application* Cordium::CreateApplication();

int main(int argc, char**argv)
{
	Cordium::Logger::Init();
	CM_CORE_WARN("Initialized Logger!");
	CM_CLIENT_INFO("Welcome to the Engine!");
	auto app = Cordium::CreateApplication();
	app->Run();
	delete app;
}

#endif 
