# CreateTabber

The tabber widget is a tabbed panel that allows the user to select different "pages" in a user interface.

## Syntax

```csharp
public static Widget CreateTabber(int x, int y, int width, int height, Widget parent)
```

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example

![Example](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTabber.png)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YourNamespace
{
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
            var sz = ui.root.ClientSize();
            var tabber = CreateTabber(10, 10, sz.x - 20, sz.y - 20, ui.root);
            tabber.AddItem("Item 1", true);
            tabber.AddItem("Item 2");
            tabber.AddItem("Item 3");

            var panels = new Widget[3];
            sz = tabber.ClientSize();
            panels[0] = CreatePanel(0, 0, sz.x, sz.y, tabber);
            panels[1] = CreatePanel(0, 0, sz.x, sz.y, tabber);
            panels[2] = CreatePanel(0, 0, sz.x, sz.y, tabber);

            //panels[0].SetColor(0.15, 0.1, 0.1, 1);
            panels[1].SetColor(0.1, 0.15, 0.1, 1);
            panels[2].SetColor(0.1, 0.1, 0.15, 1);

            panels[1].SetHidden(true);
            panels[2].SetHidden(true);

            while (true)
            {
                var ev = WaitEvent();
                switch (ev.id)
                {
                    case EVENT_WIDGETSELECT:
                        if (ev.source == tabber)
                        {
                            for (int n = 0; n < tabber.items.Count; ++n)
                            {
                                if (n == ev.data)
                                {
                                    panels[n].SetHidden(false);
                                }
                                else
                                {
                                    panels[n].SetHidden(true);
                                }
                            }
                        }
                        break;
                    case EVENT_WINDOWCLOSE:
                        return;
                }
            }
        }
    }
}
```