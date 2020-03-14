#include "Leadwerks.h"

using namespace Leadwerks;

Light* light = NULL;

int main(int argc, const char *argv[])
{
    Leadwerks::Window* window = Leadwerks::Window::Create();
    Context* context = Context::Create(window);
    World* world = World::Create();
    Camera* camera = Camera::Create();
    camera->SetRotation(0, 180, 0);
    camera->Move(0, 1, -2);
    Light* light = DirectionalLight::Create();
    light->SetRotation(35, 35, 0);

    Model* model = Model::Load("Models/Grass/grass01.mdl");
    Surface* surface = model->GetSurface(0);
    for (int v = 0; vCountVertices(); v++)
    {
        surface->SetVertexColor(v, 2, 0.5, 2, 1);
    }
    while (true)
    {
        if (window->Closed() || window->KeyDown(Key::Escape)) return false;

        Leadwerks::Time::Update();
        world->Update();
        world->Render();
        context->Sync();
    }
    return 0;
}
