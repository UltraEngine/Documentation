```csharp
using System;
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

        var sz = ui.root.ClientSize();
        var button = CreateButton("Close", sz.x / 2 - 40, sz.y / 2 - 15, 80, 30, ui.root);

        while (!window.Closed())
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WIDGETACTION:
                    if (ev.source == button)
                    {
                        window.Close();
                    }
                    break;
            }
        }
    }
}
```