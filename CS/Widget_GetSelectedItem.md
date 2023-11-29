# Widget.GetSelectedItem #

For use with listbox and combobox widgets, this method gets the selected widget item.

## Syntax ##

- int **GetSelectedItem**()

## Returns ##
Returns the selected widget item index, or -1 if no item is selected.

## Example ##
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create a window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = Engine.CreateInterface(window);
        var sz = ui.root.GetSize();

        var label = Engine.CreateLabel("Selected item: 0", 20, 20, sz.x, 30, ui.root);

        var listbox = Engine.CreateListBox(20, 50, sz.x - 40, sz.y - 70, ui.root);
        listbox.AddItem("Item 1", true);
        listbox.AddItem("Item 2");
        listbox.AddItem("Item 3");
        listbox.AddItem("Item 4");
        listbox.AddItem("Item 5");
        listbox.AddItem("Item 6");

        while (true)
        {
            var ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case Engine.Event.EVENT_WINDOWCLOSE:
                    return;
                case Engine.Event.EVENT_WIDGETSELECT:
                    label.SetText("Selected item: " + listbox.GetSelectedItem().ToString());
                    break;
            }
        }
    }
}
```