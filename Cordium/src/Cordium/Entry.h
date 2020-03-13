#pragma once
#ifdef CM_PLATFORM_WINDOWS

extern Cordium::Application* Cordium::CreateApplication();

int main(int argc, char**argv)
{
	printf("Cordium Engine\n");
	auto app = Cordium::CreateApplication();
	app->Run();
	delete app;
}

#endif 
