# Material::SetTransparent

This method sets the transparency mode of the material.

## Syntax

- void **SetTransparent**(const bool mode)

| Parameter | Description |
|---|---|
| mode | true for transparent materials, false for opaque |

## Example

```c++
#include "UltraEngine.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

const WString remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets";

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);
    framebuffer->GetSize();

    //Create world
    auto world = CreateWorld();
    world->SetAmbientLight(0.05);

    //Set environment maps
    auto specmap = LoadTexture(remotepath + "/Materials/Environment/Storm/specular.dds");
    auto diffmap = LoadTexture(remotepath + "/Materials/Environment/Storm/diffuse.dds");
    world->SetEnvironmentMap(specmap, ENVIRONMENTMAP_BACKGROUND);
    world->SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR);
    world->SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetArea(30, 30);
    light->SetRange(-20, 20);

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetPosition(0, 1, -4);
    camera->SetRefraction(true);

    //Create the scene
    auto floor = CreateBox(world, 20, 1, 20);
    floor->SetPosition(0, -0.5f, 0);
    floor->SetColor(0, 1, 0);

    auto drag = LoadModel(world, remotepath + "/Models/Stanford/dragon.glb");
    drag->SetScale(0.1f);
    drag->SetColor(1, 1, 1, 1, true);
    drag->SetReflection(false);

    //Transparent material
    auto mtl = CreateMaterial();
    mtl->SetColor(1, 1, 1, 0.25);
    mtl->SetMetalness(0.5);
    mtl->SetRoughness(0);
    mtl->SetTransparent(true);
    drag->SetMaterial(mtl, true);

    //Camera controls
    auto actor = CreateActor(camera);
    actor->AddComponent<CameraControls>();

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
