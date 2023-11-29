# Widget.SetValue

This method sets the value of a slider widget.

## Syntax

- void **SetValue**(int value)

| Parameter | Description |
|---|---|
| value | new value to set |

## Example

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
        var sz = ui.Root.ClientSize();

        //Create scrollbar
        var slider1 = new Slider(10, 10, 200, 30, ui.Root, SliderType.SCROLLBAR);
        slider1.SetRange(3, 10);

        //Create scrollbar
        var slider2 = new Slider(10, 10 + 50, 200, 30, ui.Root, SliderType.SCROLLBAR);
        slider2.SetRange(1, 10);

        //Create trackbar
        var slider3 = new Slider(10, 10 + 100, 200, 30, ui.Root, SliderType.TRACKBAR);
        slider3.SetRange(10, 20);
        slider3.SetValue(15);

        while (true)
        {
            var ev = WaitEvent();
            Widget widget = null;
            switch (ev.id)
            {
                case Event.EVENT_WIDGETACTION:
                    widget = ev.source as Widget;
                    Console.WriteLine("Slider value: " + widget.GetValue().ToString());
                    break;
                case Event.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```