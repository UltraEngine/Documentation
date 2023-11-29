# Widget.SetPixmap

This method sets a widget pixmap. It is preferable to use the [Widget.SetIcon](Widget_SetIcon.md) method if the vector image is available, we this will be resolution-independent.

## Syntax
```csharp
void SetPixmap(Pixmap pixmap, PixmapAlignment alignment = PixmapAlignment.PIXMAP_CENTER);
```

| Parameter | Description |
|---|---|
| pixmap | pixmap to set |
| alignment | may be set to `PixmapAlignment.PIXMAP_CENTER`, `PixmapAlignment.PIXMAP_CONTAIN`, `PixmapAlignment.PIXMAP_COVER`, or `PixmapAlignment.PIXMAP_STRETCH` |

```csharp
using System;
using Leadwerks;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Window.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = UI.Create(window);

        //Create a pixmap
        var pixmap = new Pixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds");

        //Show the pixmap
        ui.root.SetPixmap(pixmap);

        while (true)
        {
            var ev = Window.WaitEvent();
            switch (ev.id)
            {
                case Window.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```