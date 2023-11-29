```csharp
using System;
using Ultrapak;
using Ultrapak.UltraEngine;

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

        var label = Engine.CreateLabel("Selected item: \"Item 1\"", 20, 20, sz.x, 30, ui.root);

        var listbox = Engine.CreateListBox(20, 50, sz.x - 40, sz.y - 70, ui.root);
        listbox.AddItem("Item 1", true);
        listbox.AddItem("Item 2");
        listbox.AddItem("Item 3");
        listbox.AddItem("Item 4");
        listbox.AddItem("Item 5");
        listbox.AddItem("Item 6");

        while (true)
        {
            Event ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case Event.EVENT_WINDOWCLOSE:
                    return;
                case Event.EVENT_WIDGETSELECT:
                    int item = listbox.GetSelectedItem();
                    label.SetText("Selected item: \"" + listbox.GetItemText(item) + "\"");
                    break;
            }
        }
    }
}
```
