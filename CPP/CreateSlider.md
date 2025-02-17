# CreateSlider

The slider widget adjusts an integer value within a defined range. Three different styles are available. The slider can also be set to scroll horizontally or vertically with an additional style flag.

## Syntax

- shared_ptr<[Widget](Widget.md)\> **CreateSlider**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const SliderStyle style = SLIDER_DEFAULT)

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

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateSlider.png)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->ClientSize();
    auto slider1 = CreateSlider(10, 10, 200, 30, ui->root, SLIDER_SCROLLBAR);
    auto slider2 = CreateSlider(10, 10 + 50, 200, 30, ui->root, SLIDER_TRACKBAR);
    auto slider3 = CreateSlider(10, 10 + 50 * 2, 30, 30, ui->root, SLIDER_STEPPER | SLIDER_VERTICAL);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            Print("Widget action: " + String(ev.data));
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
