# Material::SetRoughness

This method sets the roughness of a material. A material with low roughness will appear more reflective than a rough surface.

## Syntax

- void **SetRoughness**(const float roughness)

| Parameter | Description |
|---|---|
| roughness | surface roughness between 0 and 1 |

## Example

```c++
#include "UltraEngine.h"

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
    camera->SetPosition(0, 0, -10);
    camera->SetFOV(50);

    auto specmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/specular.dds");
    auto diffmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/diffuse.dds");

    world->SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR);
    world->SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE);

    std::vector<shared_ptr<Entity> > models;

    for (int x = 0; x < 4; ++x)
    {
        for (int y = 0; y < 4; ++y)
        {
            auto mtl = CreateMaterial();
            mtl->SetRoughness(float(x) / 3.0f);
            mtl->SetMetalness(float(y) / 3.0f);

            auto ball = CreateSphere(world);
            ball->SetPosition(x * 2.0f - 3.0f, y * 2.0f - 3.0f, 0);
            ball->SetMaterial(mtl);
            models.push_back(ball);
        }
    }

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
