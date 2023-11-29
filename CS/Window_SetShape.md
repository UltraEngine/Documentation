# Window.SetShape

This method sets the window's position and size.

## Syntax

- void **SetShape**(int x, int y, int width, int height)
- void **SetShape**([iVec2](iVec2.md) position, [iVec2](iVec2.md) size)

| Parameter | Description |
| --- | --- |
| position, (x, y) | new window screen position |
| size, (width, height) | new window size |

## Example

```csharp
using UltraEngine;

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

        //Adjust window position
        var dsz = displays[0].GetSize();
        var wsz = window.GetSize();
        window.SetShape((dsz.x - wsz.x) / 2, (dsz.y - wsz.y) / 2, wsz.x, wsz.y);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```