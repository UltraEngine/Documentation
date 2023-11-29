# LoadPixmap

This function loads a pixmap from a file path or stream.

## Syntax

- **[Pixmap](Pixmap.md)** **LoadPixmap**(string path, LoadFlags flags = LOAD_DEFAULT)
- **[Pixmap](Pixmap.md)** **LoadPixmap**(Stream stream, LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load the pixmap from |
| stream | stream to load the pixmap from |
| flags | optional load flags |

## Returns

Returns the loaded pixmap, or NULL if no pixmap was loaded.

## Example

```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

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
        var pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds");

        //Show the pixmap
        ui.root.SetPixmap(pixmap);

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```