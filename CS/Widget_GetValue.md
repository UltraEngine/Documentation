# Widget.GetValue

This method gets the value of a slider widget.

## Syntax

- int **GetValue**()

## Returns

Returns the currently set widget value.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = new Interface(window);
        var sz = ui.Root.ClientSize();

        //Create scrollbar
        var slider1 = new Slider(10, 10, 200, 30, ui.Root, SliderType.SLIDER_SCROLLBAR);
        slider1.SetRange(3, 10);

        //Create scrollbar
        var slider2 = new Slider(10, 10 + 50, 200, 30, ui.Root, SliderType.SLIDER_SCROLLBAR);
        slider2.SetRange(1, 10);

        //Create trackbar
        var slider3 = new Slider(10, 10 + 100, 200, 30, ui.Root, SliderType.SLIDER_TRACKBAR);
        slider3.SetRange(10, 20);
        slider3.SetValue(15);

        while (true)
        {
            var ev = WaitEvent();
            Widget widget;
            switch (ev.id)
            {
                case EventID.EVENT_WIDGETACTION:
                    widget = ev.source as Widget;
                    Console.WriteLine("Slider value: " + widget.GetValue().ToString());
                    break;
                case EventID.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```