#pragma once
#include "Core/Types.h"
#include "Core/Core.h"
#include "Utilities/TimeStep.h"
#include "Utilities/TSingleton.h"

namespace Cordium
{
    class CD_EXPORT Engine : public ThreadSafeSingleton<Engine>
    {
        friend class TSingleton<Engine>;

    public:
        Engine();
        ~Engine();

        
        float TargetFrameRate() const { return m_MaxFramesPerSecond; }
        void SetTargetFrameRate(float targetFPS) { m_MaxFramesPerSecond = targetFPS; }
        
        static TimeStep& GetTimeStep() { return Engine::Get().m_TimeStep; }
		
		struct Stats
		{
			u32 UpdatesPerSecond;
			u32 FramesPerSecond;
			u32 NumRenderedObjects = 0;
			u32 NumShadowObjects = 0;
			float FrameTime = 0.1f;
			float UsedGPUMemory = 0.0f;
			float UsedRam = 0.0f;
		};
		
		Stats& Statistics() { return m_Stats; }
		
		private:
        
		Stats m_Stats;
		float m_MaxFramesPerSecond;
        TimeStep m_TimeStep;
    };
}