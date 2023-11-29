# Window.MouseDown

Returns the current press state of the specified mouse button.

## Syntax

- bool **MouseDown**(MouseButton button)

| Parameter | Description |
|---|---|
| button | mouse button to test, can be `MouseButton.MOUSE_LEFT`, `MouseButton.MOUSE_RIGHT`, or `MouseButton.MOUSE_MIDDLE` |

## Returns

Returns true if the specified mouse button is currently pressed, otherwise false is returned.

## Example

```csharp
//-------------------------------------------------------------------------------------------------
//
// This example uses the left mouse button to control the color of a panel widget.
//
//-------------------------------------------------------------------------------------------------

using System;
using Ultraprimitive;

class Program
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = Engine.GetDisplays();

        // Create windows
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        // Create user interface
        var ui = Engine.CreateInterface(window);

        while (true)
        {
            if (window.MouseDown(MouseButton.MOUSE_LEFT))
            {
                ui.root.SetColor(1, 0, 0, 1);
            }
            else
            {
                ui.root.SetColor(0, 0, 0, 1);
            }

            Event ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case Event.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```