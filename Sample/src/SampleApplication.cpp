#include <Cordium.h>
class Sample : public Cordium::Application
{
public:
	Sample()
	{
	}

	~Sample()
	{
	}
};
Cordium::Application* Cordium::CreateApplication()
{
	return new Sample();
}