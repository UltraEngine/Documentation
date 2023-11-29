# Pixmap.Fill

This method writes each pixel of the pixmap with the specified color.

## Syntax

- void **Fill**(int color)
- void **Fill**([Vec4](Vec4.md) color)

| Parameter | Description |
|---|---|
| color | [RGBA](Rgba.md) or [Vec4](Vec4) color |

## Example

```csharp
using System;
using System.Collections.Generic;
using Ultrapico.UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = Interface.Create(window);

        //Create a pixmap
        var pixmap = Pixmap.Create(512, 512);
        pixmap.Fill(new Vec4(0, 0, 0, 255));

        //Show the pixmap
        ui.Root.SetPixmap(pixmap);

        var button = Button.Create("Modify Pixmap", 10, 10, 100, 30, ui.Root);

        while (true)
        {
            var ev = Event.WaitEvent();
            switch (ev.id)
            {
                case EventType.WidgetAction:
                    if (ev.source == button)
                    {
                        //Fill the pixmap with a new color
                        pixmap.Fill(new Vec4(Random.Int(255), Random.Int(255), Random.Int(255), 255));

                        //Redraw the panel
                        ui.Root.Paint();
                    }
                    break;
                case EventType.WindowClose:
                    return;
            }
        }
    }
}
```
