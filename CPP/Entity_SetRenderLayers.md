# Entity::SetRenderLayers

This method is used to control which cameras an entty is visible in.

## Syntax

- void **SetRenderLayers**(const unsigned int renderlayers)

| Parameter | Description |
|---|---|
| renderlayers | bitwise flag indicating which render layers the entity should appear in |

## Remarks

The default render layers value is 1.

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

    auto box = CreateBox(world);
    box->Move(-1, 0, 2);

    auto box2 = CreateBox(world);
    box2->Move(1, 0, 2);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);

    camera->SetFog(true);
    camera->SetFogColor(0, 1, 0);
    camera->SetFogRange(0, 5);

    auto camera2 = CreateCamera(world);
    camera2->SetClearMode(ClearMode(0));
    
    camera2->SetFog(true);
    camera2->SetFogColor(1, 0, 0);
    camera2->SetFogRange(0, 5);

    //Box2 will only appear on camera 2
    box2->SetRenderLayers(2);
    camera2->SetRenderLayers(2);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
