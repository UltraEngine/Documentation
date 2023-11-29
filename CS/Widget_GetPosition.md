## Widget.GetPosition

This method returns the widget position, relative to the parent or the interface.

### Syntax

- [Vec2](iVec2.md) **GetPosition**(bool global = false)

| Parameter | Description |
|---|---|
| global | if set to false the position is relative to the parent, otherwise it is relative to the interface |

### Returns

Returns the widget position.

### Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_RESIZABLE);

        //Create User Interface
        var ui = new UserInterface(window);
        var sz = ui.root.ClientSize();

        //Create widget
        var panel = new Panel(50, 50, sz.x - 100, sz.y - 100, ui.root, PanelFlags.PANEL_BORDER);
        panel.SetLayout(0, 1, 0, 1);

        sz = panel.ClientSize();
        var label = new Label("", 0, 0, sz.x, sz.y, panel, LabelFlags.LABEL_CENTER | LabelFlags.LABEL_MIDDLE);
        label.SetLayout(1, 1, 1, 1);

        var pos = panel.GetPosition();
        label.SetText("Position: " + pos.x.ToString() + ", " + pos.y.ToString());

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventID.EVENT_WINDOWCLOSE:
                    return;
                case EventID.EVENT_WINDOWSIZE:
                    pos = panel.GetPosition();
                    label.SetText("Position: " + pos.x.ToString() + ", " + pos.y.ToString());
                    break;
            }
        }
    }
}
```