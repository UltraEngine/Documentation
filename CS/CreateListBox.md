# CreateListBox

The listbox widget displays a vertical list of items. The widget emits a WIDGETACTION event when an item is double-clicked, or when the enter key is pressed, with the item index stored in the event data member. The widget emits a WIDGETSELECT event when a new item is selected, with the item index stored in the event data member.

## Syntax
- `Widget CreateListBox(int x, int y, int width, int height, Widget parent)`

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example

![CreateListBox](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateListBox.png)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;

namespace CreateListBoxExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = Display.GetDisplays();

            //Create a window
            var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

            //Create User Interface
            var ui = Interface.Create(window);

            //Create widget
            var sz = ui.Root.GetSize();
            var listbox = CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui.Root);
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
                    case Event.EVENT_WIDGETACTION:
                        Print("Item " + ev.data.ToString() + " action");
                        break;
                    case Event.EVENT_WIDGETSELECT:
                        Print("Item " + ev.data.ToString() + " selected");
                        break;
                    case Event.EVENT_WINDOWCLOSE:
                        return;
                        break;
                }
            }
        }
    }
}
```