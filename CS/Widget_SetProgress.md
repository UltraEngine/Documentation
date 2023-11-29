# Widget.SetProgress #

This method sets the progress complete to display, for a progress bar widget.

## Syntax ##
- **void** SetProgress(**double** progress)

| Parameter | Description |
| --- | --- |
| progress | progress complete, in the range from 0 to 1 |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static bool UpdateProgress(Event e, Object extra)
    {
        Widget widget = extra as Widget;
        widget.SetProgress(((float)e.data) / 20.0f % 1.0f);
        return true;
    }

    static void Main(string[] args)
    {
        //Get the displays
        Display[] displays = GetDisplays();

        //Create a window
        Window window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        Interface ui = CreateInterface(window);

        //Create widget
        Size sz = ui.root.GetSize();
        Widget widget = CreateProgressBar(20, (sz.y - 30) / 2, sz.x - 40, 30, ui.root);
        widget.SetProgress(0.6);

        Timer progresstimer = CreateTimer(500);
        ListenEvent(EVENT_TIMERTICK, progresstimer, UpdateProgress, widget);

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```