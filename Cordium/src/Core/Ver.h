#pragma once

namespace Cordium
{
    struct InternalVer
    {
        int major = 0;
        int minor = 3;
        int patch = 0;
    };

    constexpr InternalVer const CDVer = InternalVer();

    struct Ver
    {
        enum class Stage 
        {
            GM,
            DPBeta,
            Alpha,
            Beta,
            RC,
            Release
        };
        int year = 2020;
        int release = 0;
        Stage stage = Stage::GM;
        int rev = 0;
    };
	constexpr Ver const ver = Ver();
}