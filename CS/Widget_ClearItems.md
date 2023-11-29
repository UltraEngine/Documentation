# Widget.ClearItems #
This method clears all widget items and redraws the widget.

## Syntax ##
- void **ClearItems**()

## Example ##

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
        var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = new Interface(window);
        var sz = ui.Root.GetSize();

        //Create filter input
        var button = new Button("Clear Items", 20, 20, sz.x - 40, 30, ui.Root);

        //Create list box
        var listbox = new ListBox(20, 55, sz.x - 40, sz.y - 75, ui.Root);
        listbox.AddItem("Item 1", true);
        listbox.AddItem("Item 2");
        listbox.AddItem("Item 3");
        listbox.AddItem("Item 4");
        listbox.AddItem("Item 5");
        listbox.AddItem("Item 6");

        while (true)
        {
            var ev = Interface.WaitEvent();
            switch (ev.ID)
            {
                case EventType.WidgetAction:
                    if (ev.Source == button)
                    {
                        listbox.ClearItems();
                    }
                    break;
                case EventType.WindowClose:
                    return;
            }
        }
    }
}
```