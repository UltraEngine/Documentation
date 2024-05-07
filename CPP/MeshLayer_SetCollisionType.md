# MeshLayer::SetCollisionType

```c++
#include "UltraEngine.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

const WString remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/";

int main(int argc, const char* argv[])
{
    RegisterComponents();

    //Get the primary display
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280*2, 720*2, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a rendering framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();
    
    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetPosition(0, 2, 0);
    camera->AddComponent<CameraControls>();
    camera->SetCollisionType(0);

    //Create a light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(65, 35, 0);

    //Create a terrain
    auto terrain = CreateTerrain(world, 512, 512);
    
    //Add a mesh layer
    auto model = CreateBox(nullptr);
    auto meshlayer = terrain->AddMeshLayer(model, 4.0f);
    meshlayer->Fill();
    meshlayer->SetCollisionType(0, COLLISION_SCENE);
    
    shared_ptr<Model> ball = CreateSphere(world);
    ball->SetColor(1, 0, 0);
    ball->SetMass(1);
    ball->SetCollisionType(COLLISION_PROP);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->KeyHit(KEY_SPACE))
        { 
            ball->SetPosition(camera->position);
            ball->SetVelocity(0, 0, 0);
            ball->AddForce(TransformNormal(0,0,1,camera,nullptr) * 200.0);
        }
         
        world->Update();
        world->Render(framebuffer);
    }

    return 0;
}
```
