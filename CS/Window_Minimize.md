# Window.Minimize

This method minimizes the window to the desktop taskbar.

## Syntax

- void **Minimize**()

## Example

```csharp
using System;
using UltaEngine;

namespace WindowMinimizeExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = UltaEngine.GetDisplays();

            //Create windows
            var window = UltaEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_RESIZABLE);

            //Create user interface
            var ui = UltaEngine.CreateInterface(window);

            //Maximize window
            window.Minimize();

            while (true)
            {
                var ev = UltaEngine.WaitEvent();
                switch (ev.id)
                {
                    case EventIDs.EVENT_WINDOWCLOSE:
                        return;
                }
            }
        }
    }
}
```