# Widget.SetRange

This method sets the range of a slider widget.

## Syntax

```csharp
void SetRange(int x, int y);
```

| Parameter | Description |
|---|---|
| x | minimum value for a stepper or trackbar, or visible range for a scrollbar |
| y | maximum value for a stepper or trackbar, or total range for a scrollbar |

## Remarks

If this method is used with a slider widget that uses the STEPPER slider style, the x value will be the minimum value and the y parameter will be the maximum value returned by [Widget.GetValue](Widget_GetValue.md).

If this method is used with a slider widget that uses the TRACKBAR slider style, the x value will be the value [Widget.GetValue](Widget_GetValue.md) returns when the trackbar knob is all the way to the left (or up, for a vertical slider) and the y value is the value that will be returned when the slider knob is all the way to the right (or bottom).

If this method is used with a slider widget that uses the SCROLLBAR slider style, the x value will be the range the handle takes up, and the y value will be the total range of the entire bar excluding the arrow buttons at the ends. For example, calling `SetRange(1,10)` would make the scrollbar handle take up 10% the total length of the bar. The total number of possible values the slider can have will be given by `(y - x) + 1`.

## Example

```csharp
using System;
using Ultraviolet;
using Ultraviolet.UI;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = UltravioletContext.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = new UltravioletUI(window);
        var sz = ui.Root.ClientSize;

        //Create scrollbar
        var slider1 = new Slider(10, 10, 200, 30, ui.Root, SliderStyle.Scrollbar);
        slider1.SetRange(3, 10);

        //Create scrollbar
        var slider2 = new Slider(10, 10 + 50, 200, 30, ui.Root, SliderStyle.Scrollbar);
        slider2.SetRange(1, 10);

        //Create trackbar
        var slider3 = new Slider(10, 10 + 100, 200, 30, ui.Root, SliderStyle.Trackbar);
        slider3.SetRange(10, 20);
        slider3.SetValue(15);

        while (true)
        {
            var ev = UltravioletContext.WaitEvent();
            WidgetBase widget;
            switch (ev.ID)
            {
                case UltravioletUIEvent.WidgetAction:
                    widget = ev.Source as WidgetBase;
                    Console.WriteLine("Slider value: " + widget.GetValue());
                    break;
                case UltravioletUIEvent.WindowClose:
                    return;
            }
        }
    }
}
```