# PeekEvent

This function returns true if any events are available in the event queue.

## Syntax

- bool **PeekEvent**()

## Remarks

Most GUI applications will use an event-driven design. Occasionally you may need to perform real-time operations (such as rendering). This method provides a mecahnism to incorporate events into such an application.

## Returns

Returns true of the event queue has any events waiting, otherwise false is returned.

## Example

```csharp
using System;
using GameEngine;

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

        while (true)
        {
            float r = Math.Sin(Millisecs() / 20.0) * 0.5 + 0.5;
            ui.root.SetColor(r, r, r, 1);
            Sleep(1);
            while (PeekEvent())
            {
                Event ev = WaitEvent();
                switch (ev.id)
                {
                    case Event.EVENT_WINDOWCLOSE:
                        if (ev.source == window)
                        {
                            return;
                        }
                        break;
                }
            }
        }
    }
}
```