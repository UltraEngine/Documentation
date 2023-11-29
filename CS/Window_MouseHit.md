# Window.MouseHit

Returns true if the specified mouse button has been pressed since the last call to the method, or since the creation of the window.

## Syntax

- bool **MouseHit**(MouseButton button)

| Parameter | Description |
|---|---|
| button | mouse button to test, can be `MouseButton.Left`, `MouseButton.Right`, or `MouseButton.Middle` |

## Returns

Returns true if the specified mouse button has been pressed, otherwise false is returned.

## Remarks

This method uses a global state to track whether any `MOUSEDOWN` events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the button was pressed. The event system should be used for finer control over mouse input.

## Example

```csharp
//-------------------------------------------------------------------------------------------------
//
// This example uses the left mouse button to control the color of a panel widget.
//
//-------------------------------------------------------------------------------------------------

using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create windows
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = Interface.Create(window);

        while (true)
        {
            if (window.MouseHit(MouseButton.Left))
            {
                ui.Root.SetColor(Random.Float(1.0f), Random.Float(1.0f), Random.Float(1.0f), 1);
            }

            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventID.WindowClose:
                    return;
            }
        }
    }
}
```