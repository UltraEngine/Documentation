# ActiveWindow

This function returns the focused application window.

## Syntax

```c#
Window ActiveWindow();
```

## Returns

Returns the focused window, or `null` if no application window has the focus.

## Example

```c#
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = GetDisplays();

        // Create windows
        var window1 = CreateWindow("Window 1", 0, 0, 640, 480, displays[0]);
        var window2 = CreateWindow("Window 2 (Active)", 200, 200, 640, 480, displays[0]);

        Window active;

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWSELECT:
                    active = ActiveWindow();
                    if (active == window1)
                    {
                        window1.SetText("Window 1 (Active)");
                        window2.SetText("Window 2");
                    }
                    else if (active == window2)
                    {
                        window1.SetText("Window 1");
                        window2.SetText("Window 2 (Active)");
                    }
                    else
                    {
                        window1.SetText("Window 1");
                        window2.SetText("Window 2");
                    }
                    break;
                case EVENT_WINDOWCLOSE:
                    return 0;
                    break;
            }
        }

        return 0;
    }
}
```