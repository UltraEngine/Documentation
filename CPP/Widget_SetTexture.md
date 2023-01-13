# Widget::SetTexture

This method applies a texture to the widget. Typically this is used to display the rendering output of a camera that is drawing to a texture using the [Camera::SetRenderTarget](Camera_SetRenderTarget.md) command.

## Syntax

- void **SetTexture**(const shared_ptr<[Texture](Texture.md)\> texture, const PixmapAlignment alignment = PIXMAP_CENTER)

| Parameter | Description |
|---|---|
| texture | texture to apply, or NULL |
| alignment | alignment mode, can be PIXMAP_CENTER, PIXMAP_CONTAIN, PIXMAP_COVER, PIXMAP_STRETCH, or PIXMAP_FIT |

## Remarks

This method will only work with a widget created in a 3D interface.

This method works by creating a "virtual pixmap" and assigning it to the widget. If you retrieve this pixmap it will be incompatible with pixmap commands that read or write pixel data.

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
    
    //Create and position camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetPosition(float(framebuffer->size.x) * 0.5f, float(framebuffer->size.y) * 0.5f, 0);

    //Create a panel
    auto panel = CreatePanel(ui->background->size.x / 2 - 256, ui->background->size.y / 2 - 256, 512, 512, ui->background);

    //Load and assign a texture to the panel
    auto tex = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds");
    panel->SetTexture(tex);

    while (true)
    {
        while (PeekEvent())
        {
            const Event ev = WaitEvent();
            switch (ev.id)
            {
            case EVENT_KEYDOWN:
                if (ev.data == KEY_ESCAPE) return 0;
                break;
            case EVENT_WINDOWCLOSE:
                if (ev.source == window) return 0;
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
