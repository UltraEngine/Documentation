# Actor::Copy

This method makes a copy of an actor including its entity and all components.

- shared_ptr<[Actor](Actor.md)> **Copy**()

## Returns

Returns a new actor that is a duplicate of this one.

## Example

This example copies an actor with member values intact.

```c++
#include "UltraEngine.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -4);

    //Create light]
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetRange(-10, 10);
    light->SetColor(2);

    //Create an actor
    auto box = CreateBox(world);
    box->SetPosition(1, 0, 0);
    box->SetColor(0, 0, 1);
    auto actor = CreateActor(box);

    //Add a component
    auto mover = actor->AddComponent<Mover>();

    //Set a member of the component
    mover->rotation.y = -45;

    //Create a copy including the member value we just set!
    auto actor2 = actor->Copy();
    actor2->entity->SetPosition(-1, 0, 0);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
