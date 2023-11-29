# Window.GetMousePosition

This method returns the mouse position relative to the window, in integer screen coordinates.

## Syntax

- [Vec3](iVec3.md) **MousePosition**()

## Returns

Returns the mouse screen position in the x and y components of the vector, and the mouse wheel position in the z component.

## Remarks
This method uses integer coordinates. For higher-precision mouse input use the [MouseMovement](Window_MouseMovement.md) method.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = Engine.GetDisplays();

        // Create window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        // Create user interface
        var ui = Engine.CreateInterface(window);

        // Display window position
        var sz = ui.Root.ClientSize();
        var label = Engine.CreateLabel("", 0, 0, sz.x, sz.y, ui.Root, LabelStyle.CENTER | LabelStyle.MIDDLE);
        label.SetLayout(1, 1, 1, 1);

        var pos = window.GetMousePosition();
        label.SetText("Mouse position: " + pos.x + " x " + pos.y);

        while (true)
        {
            var ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case EventId.MOUSEMOVE:
                    pos = window.GetMousePosition();
                    label.SetText("Mouse position: " + pos.x + " x " + pos.y);
                    break;
                case EventId.WINDOWCLOSE:
                    return;
            }
        }
    }
}
```

Note: The modified code assumes that the equivalent C# classes and methods are available in the C# game engine API.