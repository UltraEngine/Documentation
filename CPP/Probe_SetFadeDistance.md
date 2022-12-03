# Probe::SetFadeDistance

This method sets the probe volume edge fade. This can be used to make specified edges of the probe fade in more gradually.

## Syntax

- void **SetFadeDistance**(const float distance, const CubemapFace face)

| Parameter | Description |
|---|---|
| distance | fade distance |
| face | cubemap face, can be CUBEMAP_POSITIVE_X, CUBEMAP_NEGATIVE_X, CUBEMAP_POSITIVE_Y, CUBEMAP_NEGATIVE_Y, CUBEMAP_POSITIVE_Z, or CUBEMAP_NEGATIVE_Z |

## Example

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/probe.jpg)

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
    world->SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR);
    world->SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE);

    //Create light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(25, 315, 0);

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetPosition(8, 2.5, 0);
    camera->SetClearColor(0.125f);

    //Create the scene
    auto wall = CreateBox(world, 10, 5, 0.5);
    wall->SetPosition(0, 2.5, 4.75);
    wall->SetColor(0, 1, 1);
    
    auto wall2 = CreateBox(world, 10, 5, 0.5);
    wall2->SetPosition(0, 2.5, -4.75);
    wall2->SetColor(1, 0, 0);

    auto wall3 = CreateBox(world, 0.5, 5, 9);
    wall3->SetPosition(-4.75, 2.5, 0);
    
    auto floor = CreateBox(world, 20, 1, 20);
    floor->SetPosition(0, -0.5f, 0);

    auto ceil = CreateBox(world, 10, 0.5f, 10);
    ceil->SetPosition(0, 5.25, 0);
    
    auto drag = LoadModel(world, remotepath + "/Models/Stanford/dragon.glb");
    drag->SetScale(0.1f);
    drag->SetColor(1, 1, 1, 1, true);
    drag->SetReflection(false);
    auto mtl = CreateMaterial();
    mtl->SetMetalness(0.75);
    mtl->SetRoughness(0);
    drag->SetMaterial(mtl, true);

    auto mousepos = window->GetMouseAxis();
    Vec3 camerarotation = Vec3(0, -90, 0);
    const float mouselookspeed = 100.0f;
    Vec3 lookchange;
    const float mousesmoothing = 0.5f;

    //Create environment probe
    auto probe = CreateProbe(world);
    probe->SetScale(9.5, 5, 9.5);
    probe->SetPosition(0, 2.5, 0);
    probe->SetFadeDistance(1, CUBEMAP_POSITIVE_X);
    probe->SetFadeDistance(0, CUBEMAP_NEGATIVE_X);
    probe->SetFadeDistance(0, CUBEMAP_POSITIVE_Y);
    probe->SetFadeDistance(0, CUBEMAP_NEGATIVE_Y);
    probe->SetFadeDistance(0, CUBEMAP_POSITIVE_Z);
    probe->SetFadeDistance(0, CUBEMAP_NEGATIVE_Z);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        auto newmousepos = window->GetMouseAxis();
        if (ActiveWindow() == window)
        {
            lookchange.x = lookchange.x * mousesmoothing + (newmousepos.y - mousepos.y) * mouselookspeed * (1.0f - mousesmoothing);
            lookchange.y = lookchange.y * mousesmoothing + (newmousepos.x - mousepos.x) * mouselookspeed * (1.0f - mousesmoothing);
            camerarotation.x += lookchange.x;
            camerarotation.y += lookchange.y;
            camera->SetRotation(camerarotation);
        }
        else
        {
            lookchange = Vec3(0.0f);
        }
        mousepos = newmousepos;

        if (window->KeyDown(KEY_E)) camera->Translate(0, 0.1, 0);
        if (window->KeyDown(KEY_Q)) camera->Translate(0, -0.1, 0);
        if (window->KeyDown(KEY_D)) camera->Move(0.1, 0, 0);
        if (window->KeyDown(KEY_A)) camera->Move(-0.1, 0, 0);
        if (window->KeyDown(KEY_W)) camera->Move(0, 0, 0.1);
        if (window->KeyDown(KEY_S)) camera->Move(0, 0, -0.1);
        
        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
