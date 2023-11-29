# Pixmap.WritePixel

This method sets a single pixel in the pixmap to the specified color.

## Syntax

- void **WritePixel**(int x, int y, int color)
- void **WritePixel**(int x, int y, [Vec4](Vec4.md) color)

| Parameter | Description |
|---|---|
| x | x position of the pixel to write |
| y | y position of the pixel to write |
| color | [RGBA](Rgba.md) or [Vec4](Vec4.md) color |

## Remarks

This command is thread-safe, as long as multiple threads do not write to the same region. See the [ThreadPool](ThreadPool_Execute.md) class for an example of multi-threaded use.

This method will not work with compressed pixel formats.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create window
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = CreateInterface(window);

        //Create a pixmap
        var pixmap = CreatePixmap(512, 512);

        //Write pixel data
        for (int x = 0; x < 512; ++x)
        {
            for (int y = 0; y < 512; ++y)
            {
                pixmap.WritePixel(x, y, new Rgba(255 * (float)x / 512.0f, 255 * (float)y / 512.0f, 0, 255));
            }
        }

        //Show the pixmap
        ui.root.SetPixmap(pixmap);

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case EventId.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```
Please note that the above code assumes that the necessary namespaces and classes have been imported/defined.