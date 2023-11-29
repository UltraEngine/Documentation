```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = UltraEngine.GetDisplays();

        // Create window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        // Create user interface
        var ui = UltraEngine.CreateInterface(window);

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case UltraEngine.EVENT_WINDOWCLOSE:
                    if (ev.source == window)
                    {
                        return 0;
                    }
                    break;
            }
        }

        return 0;
    }
}
```