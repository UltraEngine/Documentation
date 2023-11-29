# CreateProgressBar

The progressbar widget displays a horizontal bar that indicates the progress of some task. The progress complete can be set using the [Widget.SetProgress](Widget_SetProgress.md) method.

## Syntax

```csharp
public Widget CreateProgressBar(int x, int y, int width, int height, Widget parent)
```

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Returns

Returns a new progress bar widget.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateProgressBar.png)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;

namespace YourNamespace
{
    class Program
    {
        static bool UpdateProgress(Event e, Object extra)
        {
            Widget widget = extra as Widget;
            widget.SetProgress((float)e.data / 20.0f % 1.0f);
            return true;
        }

        static void Main(string[] args)
        {
            //Get the displays
            List<Display> displays = Display.GetDisplays();

            //Create a window
            Window window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0]);

            //Create User Interface
            Interface ui = new Interface(window);

            //Create widget
            Vec2 sz = ui.root.GetSize();
            Widget widget = CreateProgressBar(20, (sz.y - 30) / 2, sz.x - 40, 30, ui.root);
            widget.SetProgress(0.6f);

            Timer progresstimer = new Timer(500);
            progresstimer.ListenEvent(EventType.TimerTick, UpdateProgress, widget);

            while (true)
            {
                Event ev = WaitEvent();
                switch (ev.id)
                {
                    case EventType.WindowClose:
                        return 0;
                        break;
                }
            }
        }
    }
}
```