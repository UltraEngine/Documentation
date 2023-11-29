# Window.Maximized

This method returns true if the window is maximized.

## Syntax

- bool **Maximized**()

## Returns

Returns true if the window is maximized, otherwise false is returned.

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;

namespace GameEngine
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = GetDisplays();

            //Create window
            var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

            //Create user interface
            var ui = CreateInterface(window);
            var sz = ui.root.ClientSize();
            var button = CreateButton("Toggle Window", sz.x / 2 - 50, sz.y / 2 - 15, 100, 30, ui.root);

            while (true)
            {
                var ev = WaitEvent();
                switch (ev.id)
                {
                    case EVENT_WINDOWSIZE:
                        sz = ui.root.ClientSize();
                        button.SetShape(sz.x / 2 - 50, sz.y / 2 - 15, 100, 30);
                        break;
                    case EVENT_WIDGETACTION:
                        if (ev.source == button)
                        {
                            if (window.Maximized())
                            {
                                window.Restore();
                            }
                            else
                            {
                                window.Maximize();
                            }
                        }
                        break;
                    case EVENT_WINDOWCLOSE:
                        return;
                }
            }
        }
    }
}
```