# Material::SetTessellation

This method controls whether a material will use hardware tessellation.

## Syntax

- void **SetTessellation**(const bool mode)

| Parameter | Description |
|---|---|
| mode | set to true to enable tessellation |

## Remarks

Tessellation will only be used if the camera has it enabled with [Camera::SetTessellation](Camera_SetTessellation.md).

## Example

```c++
#include "UltraEngine.h"

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
    camera->SetFov(70);
    camera->SetPosition(0, 1.5, -4);
    camera->SetClearColor(0.125);
    camera->SetRefraction(true);

    //Create the scene
    auto floor = CreateBox(world, 20, 1, 20);
    floor->SetPosition(0, -0.5f, 0);
    auto floormtl = CreateMaterial();
    floormtl->SetTexture(LoadTexture(remotepath + "/Materials/tiles.dds"));
    floor->SetMaterial(floormtl);

    auto drag = LoadModel(world, remotepath + "/Models/Stanford/dragon.glb");
    drag->SetScale(0.1f);
    drag->SetColor(1, 1, 1, 1, true);

    //Transparent material
    auto mtl = CreateMaterial();
    mtl->SetColor(1, 1, 1, 0.5);
    mtl->SetMetalness(0.5);
    mtl->SetRoughness(0.5);
    mtl->SetTransparent(true);
    drag->SetMaterial(mtl, true);

    Vec3 camerarotation;
    Vec2 axis = window->GetMouseAxis();

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Camera rotate controls
        auto newpos = window->GetMouseAxis();
        auto diff = newpos - axis;
        axis = newpos;
        camerarotation.x += diff.y * 50.0f;
        camerarotation.y += diff.x * 50.0f;
        camera->SetPosition(0, 1.5, 0);
        camera->SetRotation(camerarotation);
        camera->Move(0, 0, -4);

        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
