# Window.GetSize

This method returns the dimensions of a window. To retrieve the area inside the window excluding the titlebar and borders, use the [ClientSize](Window_ClientSize.md) method.

## Syntax

- [Vec2](iVec2.md) **ClientSize**()

Returns the window size.

## Example

```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0], Window.Style.WindowTitlebar | Window.Style.WindowResizable);

        //Create user interface
        var ui = window.CreateInterface();

        //Display window size
        var sz = ui.root.ClientSize();
        var label = new Label("", 0, 0, sz.x, sz.y, ui.root, Label.Style.LabelCenter | Label.Style.LabelMiddle);
        label.SetLayout(1, 1, 1, 1);

        sz = window.GetSize();
        var csz = window.ClientSize();
        label.SetText("Window size: " + sz.x.ToString() + " x " + sz.y.ToString() + "\n\nClient size: " + csz.x.ToString() + " x " + csz.y.ToString());

        while (true)
        {
            var ev = window.WaitForEvent();
            switch (ev.id)
            {
                case Event.Type.WindowSize:
                    sz = window.GetSize();
                    csz = window.ClientSize();
                    label.SetText("Window size: " + sz.x.ToString() + " x " + sz.y.ToString() + "\n\nClient size: " + csz.x.ToString() + " x " + csz.y.ToString());
                    break;
                case Event.Type.WindowClose:
                    return;
            }
        }
    }
}
```