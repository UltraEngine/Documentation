```csharp
using System;
using UltraEngine;

namespace GameEngineExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = Window.GetDisplays();

            //Create window
            var window = Window.CreateWindow("Parent window", 0, 0, 800, 600, displays[0]);

            //Create user interface
            var ui = Interface.CreateInterface(window);
            var sz = ui.root.ClientSize();
            var button = Button.CreateButton("Show child window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.root);

            //Create subwindow
            var subwindow = Window.CreateWindow("Child window", 200, 200, 400, 300, window, WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_HIDDEN);
            var subui = Interface.CreateInterface(subwindow);

            while (true)
            {
                var ev = WaitEvent();
                switch (ev.id)
                {
                    case EventID.EVENT_WIDGETACTION:
                        if (ev.source == button)
                        {
                            subwindow.SetHidden(false);
                            subwindow.Activate();
                        }
                        break;

                    case EventID.EVENT_WINDOWCLOSE:
                        if (ev.source == window)
                        {
                            return;
                        }
                        else if (ev.source == subwindow)
                        {
                            subwindow.SetHidden(true);
                        }
                        break;
                }
            }
        }
    }
}
```