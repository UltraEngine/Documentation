# Window.Maximize

This method maximizes the window to fill the entire desktop client area.

## Syntax

- **void Maximize**()

## Remarks

The window should be created with the WINDOW_RESIZABLE style flag included.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create windows
        var window = Window.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowStyle.WINDOW_TITLEBAR | WindowStyle.WINDOW_RESIZABLE);

        //Create user interface
        var ui = Window.CreateInterface(window);

        //Maximize window
        window.Maximize();

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case EventID.EVENT_WINDOWCLOSE:
                    return;
                    break;
            }
        }
    }
}
```