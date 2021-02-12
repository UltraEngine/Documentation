# Entity::AddScript #
This method adds a Lua script file to an entity. The properties and functions contained in the script will be added to the entity.

## Syntax ##
- bool **AddScript**(const string& path, const bool callstart = true)
- bool **AddScript**(const wstring& path, const bool callstart = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **path** | path to the script file |
| **callstart** | if set to true true the Start function will be called |

## Returns ##
Returns true if the script was loaded and added, otherwise false is returned.

## Remarks ##
You can add multiple scripts to an entity. If scripts contain overlapping properties, then the most recent value will overwrite the existing value. If scripts contain overlapping function names, they will be sorted into a metafunction that calls each version of the function, in the order they were added. If multiple script functions return multiple values, they will all be returned by the metafunction.

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
    camera->SetClearColor(0.25);
    camera->SetPosition(0, 2, 0);
    camera->Move(0, 0, -2);

    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetColor(2);
    light->SetRotation(35, 15, 0);

    //Load model
    auto fan = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/fanblades.glb");
    fan->SetPosition(0, 2, 0);

    //Attach a script
    fan->AddScript("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Scripts/Objects/Movement/Spinner.lua");
    
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