# Widget.AddItem #
This method adds an item to any widget that displays a list of items.

## Syntax ##
- int **AddItem**(string text, bool selected = false)

| Parameter | Description |
|---|---|
| text | widget item text |
| selected | if true the item will be selected |

## Returns ##
Returns the index of the new widget item.

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

        //Create widget
        var sz = ui.Root.GetSize();
        var listbox = new ListBox(20, 20, sz.x - 40, sz.y - 40, ui.Root);
        listbox.AddItem("Item 1", true);
        listbox.AddItem("Item 2");
        listbox.AddItem("Item 3");
        listbox.AddItem("Item 4");
        listbox.AddItem("Item 5");
        listbox.AddItem("Item 6");

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWCLOSE:
                    return;
                
                // Handle other events here

            }
        }
    }
}
```