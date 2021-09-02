# CreatePolygonCollider

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld(PHYSICSENGINE_BOX2D);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera    
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);
    camera->SetPosition(framebuffer->size.x / 2, framebuffer->size.y / 2);
    
    //Create the ground sprite
    auto ground = CreateSprite(world, framebuffer->size.x, 50, false, 0, true);
    ground->SetColor(0, 1, 0);

    //Create a sprite
    auto sprite = CreateSprite(world, 100, 100);
    sprite->SetMass(1);
    sprite->SetPosition(framebuffer->size.x / 2, 2000);
    sprite->mesh->Clear();
    sprite->mesh->AddVertex(-50, 0, 0);
    sprite->mesh->AddVertex(50, 0, 0);
    sprite->mesh->AddVertex(50, -100, 0);
    sprite->mesh->AddPolygon(0, 1, 2);
    sprite->mesh->Finalize();
    sprite->UpdateBounds();

    //Create collider
    auto collider = CreatePolygonCollider(sprite->mesh);
    sprite->SetCollider(collider);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
