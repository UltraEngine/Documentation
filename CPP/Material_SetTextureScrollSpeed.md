# Material::SetTextureScrollSpeed

This method can be used to enable a simple texture scroll for moving water and other effects.

## Syntax

- void **SetTextureScrollSpeed**(const float u, const float v, const float w)

| Parameter | Description |
|-----|-----|
| u, v, w | texture scroll speed |

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
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    //Create a sprite
    auto sprite = CreateSprite(world, 512, 512);
    sprite->SetPosition(-256, -256);

    //DIsplay a scrolling texture
    auto tex = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds");
    sprite->mesh->material->SetTexture(tex);
    sprite->mesh->material->SetTextureScrollSpeed(0.25, 0);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
