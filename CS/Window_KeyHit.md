## Window.KeyHit

Returns true if the specified key has been pressed since the last call to KeyHit, or since the creation of the window.

## Syntax

- **bool** **KeyHit**(KeyCode key)

| Parameter | Description |
|---|---|
| key | code of the key to check the state of |

## Returns

Returns true if the specified key has been pressed, otherwise false is returned.

## Remarks

This method uses a global state to track whether any KEYDOWN events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the key was pressed. The event system should be used for finer control over keyboard input.

## Example

```csharp
//-------------------------------------------------------------------------------------------------
//
// This example uses the space key to control the color of a panel widget.
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
            if (window.KeyHit(KeyCode.KEY_SPACE))
            {
                ui.root.SetColor(Random.Float(1.0f), Random.Float(1.0f), Random.Float(1.0f), 1);
            }

            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventId.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```