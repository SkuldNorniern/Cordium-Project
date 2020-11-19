#pragma once

#ifndef CDP_WINDOWS
#include<signal.h>
#endif
#include<stdint.h>

#ifdef CDP_WINDOWS
#define MEM_ALIGNMENT 16
#define MEM_ALIGN __declspec(align(MEM_ALIGNMENT))
#else
#define MEM_ALIGNMENT 16
#define MEM_ALIGN  __attribute__((aligned(MEM_ALIGNMENT)))

#endif

#ifdef CDP_WINDOWS
#pragma warning (disable:4251)
#ifdef CD_DYNAMIC
#ifdef CD_ENGINE
#define CD_EXPORT __declspec(dllexport)
#else
#define CD_EXPORT __declspec(dllimport)
#endif
#else
#define CD_EXPORT
#endif
#define CD_HIDDEN
#else
#define CD_EXPORT __attribute__ ((visibility ("default")))
#define CD_HIDDEN __attribute__ ((visibility ("hidden")))
#endif  

