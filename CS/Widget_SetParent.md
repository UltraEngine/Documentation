# Widget.SetParent

This method makes this widget a child of the specified parent widget.

## Syntax

- void **SetParent**(Widget parent)
- void **SetParent**(Widget parent, int position)

| Parameter | Description |
| --- | --- |
| parent | new parent widget |
| position | the position in the parent child list to insert this widget |

## Remarks
If the position is not specified the widget will be added to the end of the parent's list of children.

The parent widget may be NULL if you are deleting the widget.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowStyle.WINDOW_TITLEBAR | WindowStyle.WINDOW_RESIZABLE);

        //Create User Interface
        var ui = UltraEngine.CreateInterface(window);
        var sz = ui.root.ClientSize();

        //Panel
        var panel = UltraEngine.CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.root);
        panel.SetColor(0, 0, 0);
        panel.SetLayout(1, 1, 1, 1);

        //Subpanel
        sz = panel.ClientSize();
        var subpanel = UltraEngine.CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.root);
        subpanel.SetColor(0.5, 0.5, 0.5);
        subpanel.SetLayout(1, 1, 1, 1);
    
        //Parent the subpanel to the panel
        subpanel.SetParent(panel);

        while (true)
        {
            Event ev = UltraEngine.WaitEvent();
            switch (ev.id)
            {
                case EventType.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```