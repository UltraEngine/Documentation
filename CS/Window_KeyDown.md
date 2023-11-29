# Window.KeyDown

Returns the current key state of the specified key.

## Syntax

- bool **KeyDown**(KeyCode key)

| Parameter | Description |
|---|---|
| key | code of the key to check the state of |

## Returns

Returns true if the specified key is currently pressed, otherwise false is returned.

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
        var displays = GetDisplays();

        //Create windows
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = CreateInterface(window);

        while (true)
        {
            if (window.KeyDown(KeyCode.KEY_SPACE))
            {
                ui.root.SetColor(1, 0, 0, 1);
            }
            else
            {
                ui.root.SetColor(0, 0, 0, 1);
            }

            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventID.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```