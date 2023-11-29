```csharp
using System;
using UltraEngine; // assuming the necessary libraries are imported

public class EmitEventExample
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create window
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = CreateInterface(window);
        var sz = ui.root.ClientSize();
        var button = CreateButton("Close window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.root);

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WIDGETACTION:
                    if (ev.source == button)
                    {
                        EmitEvent(EVENT_WINDOWCLOSE, window);
                    }
                    break;
                case EVENT_WINDOWCLOSE:
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
