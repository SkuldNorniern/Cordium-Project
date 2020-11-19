#include <Cordium.h>
#include <Core/EntryPoint.h>

using namespace Cordium;

class Game : public Application
{
    public:
	explicit Game()
		: Application("/Editor/", "Editor")
	{
        Application::Get().GetWindow()->SetWindowTitle("Editor");
	}

	~Game()
	{
	}

	void Init() override
	{
		Application::Init();
        
        GetSceneManager()->EnqueueScene<Scene3D>("Physics");
		GetSceneManager()->EnqueueScene<SceneModelViewer>("SceneModelViewer");
		GetSceneManager()->EnqueueScene<GraphicsScene>("Terrain");
		GetSceneManager()->EnqueueScene<MaterialTest>("Material");
	}
};

Cordium::Application* Cordium::CreateApplication()
{
	return new Game();
}