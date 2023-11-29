# CreateLabel #

The label widget displays a read-only block of text.

## Syntax ##

- [Widget](Widget.md) **CreateLabel**(string text, int x, int y, int width, int height, [Widget](Widget.md) parent, ButtonStyle = LABEL_DEFAULT)

|Parameter|Description|
|---|---|
| text | widget text |
| x | widget x position |
| y | widget y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | optional button style, can be any combination of LABEL_LEFT, LABEL_RIGHT, LABEL_CENTER, LABEL_TOP, LABEL_MIDDLE, LABEL_BOTTOM, and LABEL_BORDER |

## Example ##

![CreateLabel](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateLabel.png)

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
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = Interface.Create(window);

        //Create widget
        var label1 = Widget.CreateLabel("Label", 20, 20, 120, 30, ui.root);
        var label2 = Widget.CreateLabel("Border Label", 20, 50, 120, 30, ui.root, ButtonStyle.LABEL_BORDER | ButtonStyle.LABEL_CENTER | ButtonStyle.LABEL_MIDDLE);

        while (window.Closed == false)
        {
            Event.Wait();
        }
    }
}
```