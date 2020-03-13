#pragma once
#include <memory>
#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
namespace Cordium
{
	class CORDIUM_API Logger
	{
	public:
		static void Init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() 
		{
			return s_CoreLogger;
		}
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger()
		{
			return s_ClientLogger;
		}
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}
//Core log
#define CM_CORE_ERROR(...)    ::Cordium::Logger::GetCoreLogger()->error(__VA_ARGS__)
#define CM_CORE_WARN(...)     ::Cordium::Logger::GetCoreLogger()->warn(__VA_ARGS__)
#define CM_CORE_INFO(...)     ::Cordium::Logger::GetCoreLogger()->info(__VA_ARGS__)
#define CM_CORE_TRACE(...)    ::Cordium::Logger::GetCoreLogger()->trace(__VA_ARGS__)

//Client log
#define CM_CLIENT_ERROR(...)  ::Cordium::Logger::GetClientLogger()->error(__VA_ARGS__)
#define CM_CLIENT_WARN(...)  ::Cordium::Logger::GetClientLogger()->warn(__VA_ARGS__)
#define CM_CLIENT_INFO(...)  ::Cordium::Logger::GetClientLogger()->info(__VA_ARGS__)
#define CM_CLIENT_TRACE(...)  ::Cordium::Logger::GetClientLogger()->trace(__VA_ARGS__)