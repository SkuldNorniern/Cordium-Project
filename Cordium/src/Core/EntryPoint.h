#if defined(CDP_WINDOWS)

#include "Core/CoreSystem.h"
#include "Platform/Windows/WindowsOS.h"

#pragma comment(linker, "/subsystem:windows")

#ifndef NOMINMAX
#define NOMINMAX // For windows.h
#endif

#include <windows.h>

extern Cordium::Application* Cordium::CreateApplication();

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int)
{
	Cordium::Internal::CoreSystem::Init(false);

    auto windowsOS = new Cordium::WindowsOS();
    Cordium::OS::SetInstance(windowsOS);

    windowsOS->Init();
    
    Cordium::CreateApplication();

    windowsOS->Run();
    delete windowsOS;

	Cordium::Internal::CoreSystem::Shutdown();
}

#elif defined(CDP_LINUX)

#include "Core/CoreSystem.h"
#include "Platform/Unix/UnixOS.h"

extern Cordium::Application* Cordium::CreateApplication();

int main(int argc, char** argv)
{
	Cordium::Internal::CoreSystem::Init(false);
    
    auto unixOS = new Cordium::UnixOS();
    Cordium::OS::SetInstance(unixOS);
    unixOS->Init();
    
    Cordium::CreateApplication();

    unixOS->Run();
    delete unixOS;

	Cordium::Internal::CoreSystem::Shutdown();
}


#elif defined(CDP_MACOS)

#include "Platform/MacOS/MacOSOS.h"

int main(int argc, char** argv)
{
	Cordium::Internal::CoreSystem::Init(false);

    auto macOSOS = new Cordium::MacOSOS();
    Cordium::OS::SetInstance(macOSOS);
    macOSOS->Init();
    
    Cordium::CreateApplication();

    macOSOS->Run();
    delete macOSOS;

    Cordium::Internal::CoreSystem::Shutdown();
}

#elif defined(LUMOS_PLATFORM_IOS)


#endif