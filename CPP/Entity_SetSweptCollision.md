# Entity::SetSweptCollision

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

    //-----------------------------------------------------------------------------------
    // 
    // This will set up two boxes and fire them at each other at a high velocity
    // When swept collision is enabled they will hit each other and stop, but if it
    // is disabled they will pass right though each other
    // 
    //-----------------------------------------------------------------------------------

    //Set this to false to see the effect it has
    const bool SWEPT_COLLISION = true;

    auto sprite1 = CreateSprite(world, 100, 100, false, 0, true);
    sprite1->SetPosition(-300, 300, 0);
    sprite1->SetMass(1);
    sprite1->SetColor(1, 0, 0);
    sprite1->SetVelocity(10000, 0);
    sprite1->SetSweptCollision(SWEPT_COLLISION);
     
    auto sprite2 = CreateSprite(world, 100, 100, false, 0, true);
    sprite2->SetPosition(200, 300, 0);
    sprite2->SetMass(1);
    sprite2->SetColor(0, 0, 1);
    sprite2->SetVelocity(-10000, 0);
    sprite2->SetSweptCollision(SWEPT_COLLISION);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
