# LoadIcon

This function loads a vector image from a file path or stream.

## Syntax

- `Icon LoadIcon(string path, LoadFlags flags = LOAD_DEFAULT)`
- `Icon LoadIcon(Stream stream, LoadFlags flags = LOAD_DEFAULT)`

| Parameter | Description |
|---|---|
| path | file path to load the icon from |
| stream | stream to load the icon from |
| flags | optional loading flags |

## Returns

Returns the loaded icon object if successful, otherwise NULL is returned.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 800, displays[0]);

        //Create user interface
        var ui = Interface.Create(window);

        //Create a pixmap
        var icon = LoadIcon("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Logos/23.svg");

        //Show the icon
        ui.root.SetIcon(icon);

        while (true)
        {
            var ev = WaitForEvent();
            switch (ev.id)
            {
                case EventID.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```
Note: The syntax for the `LoadIcon` function remains the same, only the variable types have been changed to their respective types in C#.