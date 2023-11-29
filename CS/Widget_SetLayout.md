## Widget.SetLayout

This method controls the way a widget behaves when its parent is resized or when the DPI scale setting is changed.

### Syntax

- void **SetLayout**(int left, int right, int top, int bottom)

| Parameter | Description |
| --- | --- |
| left, right, top, bottom | edge clamp mode, can be 0 or 1 |

### Example 

```csharp
//----------------------------------------------------------------------------------------------------------
//
// This example demonstrates widget layout settings. Resize the window to see how each panel adjusts size
//  
//----------------------------------------------------------------------------------------------------------

using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = AbstractGameEngine.GetDisplays();

        //Create window
        var window = AbstractGameEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], AbstractGameEngine.WINDOW_TITLEBAR | AbstractGameEngine.WINDOW_RESIZABLE);
        window.SetMinSize(640, 480);

        //Create user interface
        var ui = AbstractGameEngine.CreateInterface(window);

        //Create widgets
        iVec2 sz = ui.root.ClientSize();

        var leftpanel = AbstractGameEngine.CreatePanel(10, 10, 200, sz.y - 20, ui.root);
        leftpanel.SetLayout(1, 0, 1, 1);
        leftpanel.SetColor(0, 0, 0, 1);
        leftpanel.SetText("Left panel\nLayout: 1, 0, 1, 1");

        var rightpanel = AbstractGameEngine.CreatePanel(sz.x - 10 - 200, 10, 200, sz.y - 20, ui.root);
        rightpanel.SetLayout(0, 1, 1, 1);
        rightpanel.SetColor(0, 0, 0, 1);
        rightpanel.SetText("Right panel\nLayout: 0, 1, 1, 1");

        var mainpanel = AbstractGameEngine.CreatePanel(10 + 200 + 10, 10, sz.x - 10 * 4 - 200 * 2, sz.y - 10 * 3 - 100, ui.root);
        mainpanel.SetLayout(1, 1, 1, 1);
        mainpanel.SetColor(0, 0, 0, 1);
        mainpanel.SetText("Main panel\nLayout: 1, 1, 1, 1");

        var bottompanel = AbstractGameEngine.CreatePanel(10 + 200 + 10, sz.y - 10 - 100, sz.x - 10 * 4 - 200 * 2, 100, ui.root);
        bottompanel.SetLayout(1, 1, 0, 1);
        bottompanel.SetColor(0, 0, 0, 1);
        bottompanel.SetText("Bottom panel\nLayout: 1, 1, 0, 1");

        while (true)
        {
            var ev = AbstractGameEngine.WaitEvent();
            switch (ev.id)
            {
                case AbstractGameEngine.EVENT_WINDOWCLOSE:
                    if (ev.source == window)
                    {
                        System.Environment.Exit(0);
                    }
                    break;
            }
        }
    }
}
```