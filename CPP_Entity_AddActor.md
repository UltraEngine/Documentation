# Entity::AddComponent #
This method adds an actor to an entity. An actor is a user-defined class derived from the base [Actor](CPP_Actor.md) class that can be used to add behaviors to an entity.

## Syntax ##
- void **AddActor**(shared_ptr<[Actor](CPP_Actor.md)> actor, const bool callstart = true);

### Parameters ###
| Name | Description |
| - | - |
| actor | actor to add |
| callstart | if set to true, the actor Start method will be called |

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
    //Create window
    auto displays = ListDisplays();
    float displayscale = displays[0]->GetScale().x;
    auto window = CreateWindow(displays[0], "", 0, 0, 1280 * displayscale, 720 * displayscale);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();
    world->SetAmbientLight(0.1);
    world->RecordStats(true);

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 2, 0);
    camera->Move(0, 0, -2);

    //Create light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetColor(2);
    light->SetRotation(35, 15, 0);

    //Load model
    auto fan = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/fanblades.glb");
    fan->SetPosition(0, 2, 0);

    //Attach an actor
    auto spinner = make_shared<Spinner>();
    spinner->speed = Vec3(0, 0, -5);
    fan->AddComponent(spinner);

    //Main loop
    while (!window->KeyHit(KEY_ESCAPE) and !window->Closed())
    {
        //Sync with the physics thread
        world->Update();

        //Sync with the rendering thread
        world->Render(framebuffer);
    }
    return 0;
}
```
