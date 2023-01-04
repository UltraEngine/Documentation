# CreateInterface

This function creates a new graphical user interface for desktop applications or in-game interfaces.

## Syntax

- shared_ptr<[Interface](Interface.md)\> **CreateInterface**(shared_ptr<[Window](Window.md)\> window)
- shared_ptr<[Interface](Interface.md)\> **CreateInterface**(shared_ptr<[World](World.md)\> world, shared_ptr<[Font](Font.md)\> font, [iVec2](iVec2.md)\> size)

| Parameter | Description |
| --- | --- |
| window | window to create the user interface on |
| world | world to create the interface in, for 3D graphics |
| font | font to use, for 3D graphics |
| size | interface dimensions, for 3D graphics |

## Returns

Returns a new interface object.

## Example

The first example shows how to create an interface directly on a window for an event-based application.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create widget
    iVec2 sz = ui->root->ClientSize();
    auto button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            if (ev.source == window)
            {
                return 0;
            }
            break;
        }
    }
    return 0;
}
```

The second example shows how to create an interface that appears in a 3D rendering viewport. Note that in this example you must send events to the interface with the [ProcessEvent](Interface_ProcessEvent.md) method.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Load a font
    auto font = LoadFont("Fonts/arial.ttf");

    //Create user interface
    auto ui = CreateInterface(world, font, framebuffer->size);

    //Create widget
    iVec2 sz = ui->root->ClientSize();
    auto button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    //Create camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetPosition(framebuffer->size.x / 2, framebuffer->size.y / 2, 0);

    while (true)
    {
        while (PeekEvent())
        {
            const Event ev = WaitEvent();
            switch (ev.id)
            {
            case EVENT_WINDOWCLOSE:
                if (ev.source == window)
                {
                    return 0;
                }
                break;
            default:
                ui->ProcessEvent(ev);
                break;
            }
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
