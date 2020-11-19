#include "Precompiled.h"
#include "CoreSystem.h"
#include "VFS.h"
#include "JobSystem.h"
#include "Scripting/Lua/LuaManager.h"
#include "Core/Ver.h"
 
#include "Core/OS/MemoryManager.h"

namespace Cordium
{ 
	namespace Internal 
	{
	void CoreSystem::Init(bool enableProfiler)
	{
        Debug::Log::OnInit();

		CD_LOG_INFO("Cordium Engine - Version {0}.{1}.{2}", LumosVersion.major, LumosVersion.minor, LumosVersion.patch);

		System::JobSystem::OnInit();
		CD_LOG_INFO("Initializing System");
		VFS::OnInit();
        LuaManager::Get().OnInit();
	}

	void CoreSystem::Shutdown()
	{
		CD_LOG_INFO("Shutting down System");
		LuaManager::Release();
		VFS::OnShutdown();
		Cordium::Memory::LogMemoryInformation();

		Debug::Log::OnRelease();

		MemoryManager::OnShutdown();
    }
} }