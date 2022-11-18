# World::RecordStats

This method is used to enable or disable statistics recording. Statistics recording is disabled by default, so you need to enable it if you are displaying statistical information.

## Syntax

- void **RecordStats**(const bool record)

| Parameter | Description |
|---|---|
| record | if set to true statistics recording is enabled, otherwise it is disabled |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Move(0, 0, -4);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-20, 20);
    light->SetArea(20, 20);
    light->SetRotation(45, 35, 0);

    //Create model
    auto box = CreateBox(world);

    //Enable stats recording
    world->RecordStats(true);

    //Setup 2D display
    auto cam2d = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    cam2d->SetRenderLayers(RENDERLAYER_7);
    cam2d->SetClearMode(CLEAR_DEPTH);
    cam2d->SetPosition(float(framebuffer->size.x) * 0.5f, float(framebuffer->size.y) * 0.5f);

    auto font = LoadFont("Fonts/arial.ttf");
    auto sprite = CreateSprite(world, font, "", 18);
    sprite->SetRenderLayers(RENDERLAYER_7);
    sprite->SetPosition(2, framebuffer->size.y - font->GetHeight(18) - 2, 0);

    //Main loop
    while (window->Closed() == false)
    {
        //Display the feamerate
        sprite->SetText("FPS: " + String(world->renderstats.framerate));

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
