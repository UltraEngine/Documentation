# Widget.SelectItem #

For use with listbox and combobox widgets, this method selects a widget item.

## Syntax ##

- void **SelectItem**(int index)

| Parameter | Description |
|-|-|
| index | widget item index, in the range from zero to the number of items minus one, or -1 to deselect all items |

## Example

```csharp
using System;
using UltrasUnityLibrary;

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

        //Create widget
        var sz = ui.root.GetSize();
        var listbox = Engine.CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui.root);

        //Add items
        for (int n = 0; n < 10; ++n)
        {
            listbox.AddItem("Item " + n.ToString());
        }

        //Select an item
        listbox.SelectItem(3);

        while (true)
        {
            var ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case Engine.EventId.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```
