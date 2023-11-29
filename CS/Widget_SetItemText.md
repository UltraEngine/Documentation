# Widget.SetItemText
This method sets a widget item's text and redraws the widget.

## Syntax
```csharp
void **SetItemText**(int item, string text)
```

| Parameter | Description | 
| --- | --- |
| item | widget item index |
| text | text to set |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = CreateInterface(window);

        //Create widget
        var sz = ui.root.GetSize();
        var listbox = CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui.root);
        listbox.AddItem("Item 1", true);
        listbox.AddItem("Item 2");
        listbox.AddItem("Item 3");
        listbox.AddItem("Item 4");
        listbox.AddItem("Item 5");
        listbox.AddItem("Item 6");

        //Modify the item text
        listbox.SetItemText(0, "This is the first item");

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```