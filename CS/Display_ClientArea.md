# Display.ClientArea

This method returns the usable area within a screen, excluding system task bars or other decorations.

## Syntax

- [IntRect](IntRect.md) **ClientArea**()

## Returns

Returns the usable area of the screen.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        IntRect area = displays[0].ClientArea();

        //Create a window
        var window = Window.Create("Ultra Engine", area.x, area.y, area.width, area.height, displays[0], WindowStyle.WINDOW_TITLEBAR | WindowStyle.WINDOW_RESIZABLE);

        //Create User Interface
        var ui = window.CreateInterface();

        while (true)
        {
            var ev = Window.WaitEvent();
            switch (ev.id)
            {
                case EventType.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```