# Interface.SetScale

This method sets the DPI scaling value of an interface.

## Syntax

- void **SetScale**(float scale)

| Parameter | Description |
| --- | --- |
| scale | DPI scaling value to set |

## Remarks

Because computer displays vary in pixel density, it is helpful to display your application with scaling for the current user settings. It's best to create your application interface assuming 100% scaling, and then apply scaling. You can also create new widgets after scaling is applied, and multiply their coordinates by the current scaling factor.

If you make all widget positions and sizes a multiple of 4, all coordinates will scale to an exact integer and provide a better appearance.

## Example

```cs
//---------------------------------------------------------------------------------------------------
//
// This example demonstrates an easy way to handle DPI scaling for resolution-independent interfaces.
// The user interface is created using 100 scaling and then the interface is rescaled if the display
// scale is not 100%. The program listens for additional window DPI scale change events in case the user
// changes this value in the system settings while this program is running.
// 
//---------------------------------------------------------------------------------------------------

using System;
using UltraEngine;

public class Program
{
    static bool Callback(Event ev, Object extra)
    {
        //Resize window if desired
        Window window = ev.source as Window;
        window.SetShape(ev.position, ev.size);
        
        //Get the user interface
        Interface ui = extra as Interface;
        ui.SetScale((float)ev.data / 100.0f);

        return true;
    }

    public static void Main()
    {
        //Get the displays
        Display[] displays = Display.GetDisplays();

        //Create window
        Window window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0], WindowStyle.Titlebar | WindowStyle.Resizable);
        window.SetMinSize(640, 480);

        //Create user interface
        Interface ui = new Interface(window);

        //Create widgets
        iVec2 sz = ui.root.ClientSize();

        Panel leftpanel = new Panel(10, 10, 200, sz.y - 20, ui.root);
        leftpanel.SetLayout(1, 0, 1, 1);
        leftpanel.SetColor(0, 0, 0, 1);

        Panel rightpanel = new Panel(sz.x - 10 - 200, 10, 200, sz.y - 20, ui.root);
        rightpanel.SetLayout(0, 1, 1, 1);
        rightpanel.SetColor(0, 0, 0, 1);

        Panel mainpanel = new Panel(10 + 200 + 10, 10, sz.x - 10 * 4 - 200 * 2, sz.y - 10 * 3 - 100, ui.root);
        mainpanel.SetLayout(1, 1, 1, 1);
        mainpanel.SetColor(0, 0, 0, 1);

        Panel bottompanel = new Panel(10 + 200 + 10, sz.y - 10 - 100, sz.x - 10 * 4 - 200 * 2, 100, ui.root);
        bottompanel.SetLayout(1, 1, 0, 1);
        bottompanel.SetColor(0, 0, 0, 1);

        window.ListenEvent(EventType.WindowDpiChanged, Callback, ui);

        //Trigger a rescale if the display scale is not 100%
        if (displays[0].scale != 1.0f)
        {
            window.EmitEvent(EventType.WindowDpiChanged, (int)(displays[0].scale * 100.0f), 0, 0, (int)(800 * displays[0].scale), (int)(600 * displays[0].scale));
        }

        while (true)
        {
            Event ev = UltraEngine.WaitEvent();
            switch (ev.id)
            {
                case EventType.WindowClose:
                    if (ev.source == window)
                    {
                        UltraEngine.Exit();
                    }
                    break;
            }
        }
    }
}
```