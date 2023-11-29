# CreateSlider

The slider widget adjusts an integer value within a defined range. Three different styles are available. The slider can also be set to scroll horizontally or vertically with an additional style flag.

## Syntax

- **[Widget](Widget.md)** **CreateSlider**(int x, int y, int width, int height, **[Widget](Widget.md)** parent, SliderStyle style = SLIDER_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | slider style, can be any combination of SLIDER_SCROLLBAR, SLIDER_STEPPER, SLIDER_TRACKBAR, SLIDER_HORIZONTAL, and SLIDER_VERTICAL |

## Returns

Returns a new slider widget.

## Example

![CreateSlider](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateSlider.png)

```csharp
using System;
using UltraEngine;

public class CreateSliderExample
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = CreateInterface(window);

        //Create widget
        var sz = ui.root.ClientSize();
        var slider1 = CreateSlider(10, 10, 200, 30, ui.root, SliderStyle.SLIDER_SCROLLBAR);
        var slider2 = CreateSlider(10, 10 + 50, 200, 30, ui.root, SliderStyle.SLIDER_TRACKBAR);
        var slider3 = CreateSlider(10, 10 + 50 * 2, 30, 30, ui.root, SliderStyle.SLIDER_STEPPER | SliderStyle.SLIDER_VERTICAL);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventID.EVENT_WIDGETACTION:
                    Print("Widget action: " + ev.data);
                    break;
                case EventID.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```