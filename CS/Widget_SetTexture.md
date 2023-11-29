# Widget.SetTexture

This method applies a texture to the widget. Typically this is used to display the rendering output of a camera that is drawing to a texture using the [Camera.SetRenderTarget](Camera_SetRenderTarget.md) command.

## Syntax

- void **SetTexture**(Texture texture, PixmapAlignment alignment = PIXMAP_CENTER)

| Parameter | Description |
|---|---|
| texture | texture to apply, or null |
| alignment | alignment mode, can be PIXMAP_CENTER, PIXMAP_CONTAIN, PIXMAP_COVER, PIXMAP_STRETCH, or PIXMAP_FIT |

## Remarks

This method will only work with a widget created in a 3D interface.

This method works by creating a "virtual" pixmap that stores no pixel data, and assigning it to the widget. If you retrieve this pixmap, it will be incompatible with pixmap commands that read or write pixel data.

## Example

```csharp
using System;
using UEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

        //Create framebuffer
        var framebuffer = UltraEngine.CreateFramebuffer(window);

        //Create world
        var world = UltraEngine.CreateWorld();

        //Load a font
        var font = UltraEngine.LoadFont("Fonts/arial.ttf");

        //Create user interface
        var ui = UltraEngine.CreateInterface(world, font, framebuffer.size);

        //Create and position camera
        var camera = UltraEngine.CreateCamera(world, UltraEngine.ProjectionType.ORTHOGRAPHIC);
        camera.SetPosition((float)framebuffer.size.x * 0.5f, (float)framebuffer.size.y * 0.5f, 0);

        //Create a panel
        var panel = UltraEngine.CreatePanel(ui.background.size.x / 2 - 256, ui.background.size.y / 2 - 256, 512, 512, ui.background);

        //Load and assign a texture to the panel
        var tex = UltraEngine.LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds");
        panel.SetTexture(tex);

        while (true)
        {
            while (UltraEngine.PeekEvent())
            {
                var ev = UltraEngine.WaitEvent();
                switch (ev.id)
                {
                    case UltraEngine.EventType.KEYDOWN:
                        if (ev.data == UltraEngine.KeyCode.ESCAPE) return;
                        break;
                    case UltraEngine.EventType.WINDOWCLOSE:
                        if (ev.source == window) return;
                        break;
                    default:
                        ui.ProcessEvent(ev);
                        break;
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```