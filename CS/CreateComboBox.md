# CreateComboBox

The combobox widget displays a drop-down box the user can select an item from. This widget emits a WIDGETSELECT event when a new item is selected.

## Syntax

- `Widget` **CreateComboBox**(int x, int y, int width, int height, `Widget` parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example

![CreateComboBox](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateComboBox.png)

```csharp
using System;
using Leadwerks;

namespace CreateComboBoxExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = App.GetDisplays();

            //Create a window
            var window = Window.Create("Ultra Engine", 0, 0, 640, 480, displays[0]);

            //Create User Interface
            var ui = Interface.Create(window);

            //Create widget
            var sz = ui.Root.ClientSize;
            var combobox = Widget.CreateComboBox((sz.X - 300) / 2, (sz.Y - 30) / 2, 300, 30, ui.Root);
            for (int n = 0; n < 20; ++n)
            {
                combobox.AddItem("Item " + n.ToString(), (n == 0));
            }

            while (true)
            {
                var ev = Window.WaitEvent();
                switch (ev.ID)
                {
                    case Window.Event.WidgetSelect:
                        Console.WriteLine("Item " + ev.Data.ToString() + " selected");
                        break;
                    case Window.Event.WindowClose:
                        return;
                }
            }
        }
    }
}
```