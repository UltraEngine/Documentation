# CreatePanel

This function creates a Panel widget. The Panel widget is a rectangular area for framing child widgets.

## Syntax

- [Widget](Widget.md) **CreatePanel**(int x, int y, int width, int height, [Widget](Widget.md) parent, PanelStyle style = PANEL_DEFAULT)

| Parameter | Description |
|---|---|
| x | initial x position of the widget |
| y | initial y position of the widget |
| width | initial width of the widget |
| height | initial height of the widget |
| parent | parent of the widget |
| style | optional widget style, can be PANEL_DEFAULT, PANEL_BORDER, or PANEL_GROUP |

## Returns

Returns a new panel widget.

## Example

![CreatePanel](https://github.com/Leadwerks/Documentation/raw/master/Images/CreatePanel.png)

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

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_RESIZABLE);

        //Create User Interface
        var ui = Interface.Create(window);
        var sz = ui.Root.ClientSize();

        //Create widget
        var panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.Root);
        panel.SetColor(0, 0, 0, 1);
        panel.SetLayout(1, 1, 1, 1);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventId.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```