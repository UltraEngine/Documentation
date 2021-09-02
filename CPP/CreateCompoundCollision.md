# CreateCompoundCollision


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

    //Create the ground sprite
    auto ground = CreateSprite(world, framebuffer->size.x, 50, false, 0, true);
    ground->SetPosition(-framebuffer->size.x / 2, -framebuffer->size.y / 2, 1);
    ground->SetColor(0, 1, 0);

    //Add some boxes
    auto sprite1 = CreateSprite(world, 200, 20);
    sprite1->mesh->Recenter();
    sprite1->mesh->Finalize();
    sprite1->UpdateBounds();
    sprite1->SetColor(1, 0, 0);

    auto sprite2 = sprite1->Instantiate(world);
    sprite2->SetRotation(0, 0, 90);
    sprite2->SetColor(1, 0, 0);
    sprite2->SetParent(sprite1);

    //Create a compound collision shape
    vector<shared_ptr<Collider> > subshapes(2);
    subshapes[0] = CreateRectCollider(-100, -10, 200, 20);
    subshapes[1] = CreateRectCollider(-10, -100, 20, 200);
    auto collider = CreateCompoundCollider(subshapes);

    sprite1->SetMass(1);
    sprite1->SetCollider(collider);
    sprite1->SetRotation(22.5);
    sprite1->SetPosition(0, 1500, 0);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
