# Window.Activate

This method makes the window gain the keyboard focus and brings it to the top of the window order.

## Syntax

- void **Activate**()

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create window
        var window1 = Engine.CreateWindow("Window 1", 0, 0, 640, 480, displays[0]);

        var window2 = Engine.CreateWindow("Window 2", 200, 200, 640, 480, displays[0]);

        window1.Activate();

        while (true)
        {
            Event ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case Engine.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```