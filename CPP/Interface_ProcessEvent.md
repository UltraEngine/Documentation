# Interface::ProcessEvent

This method sends an event to an interface to be evaluated.

## Syntax

- void **ProcessEvent**(const [Event](Event)& ev)

| Parameter | Description |
|---|---|
| ev | event to be evaluated |

## Remarks

When an interface is created directly on a window it will automatically receive events from the window. However, when an interface is created to appear in a 3D rendering viewport, events must be manually sent to the interfaces. This allows the user to make changes to events. For example, the coordinates of a mouse event can be transform from 3D space to coordinates on a panel in the 3D world.

## Example

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
