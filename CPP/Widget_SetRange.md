# Widget::SetRange

This method sets the range of a slider widget.

## Syntax

- void **SetRange**(const int x, const int y)

| Parameter | Description |
|---|---|
| x | minimum value for a stepper or trackbar, or visible range for a scrollbar  |
| y | maximum value for a stepper or trackbar, or total range for a scrollbar |

## Remarks

If this method is used with a slider widget that uses the STEPPER slider style, the x value will be the minimum value and the y parameter will be the maximum value returned by [Widget::GetValue](Widget_GetValue.md).

If this method is used with a slider widget that uses the TRACKBAR slider style, the x value will be the value [Widget::GetValue](Widget_GetValue.md) returns when the trackbar knob is all the way to the left (or up, for a vertical slider) and the y value is the value that will be returned when the slider knob is all the way to the right (or bottom).

If this method is used with a slider widget that uses the SCROLLBAR slider style, the x value will be the range the handle takes up, and the y value will be the total range of the entire bar excluding the arrow buttons at the ends. For example, calling **SetRange**(1,10) would make the scrollbar handle take up 10% the total length of the bar. The total number of possible values the slider can have will be given by (y - x) + 1.

## Example

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
    auto sz = ui->root->ClientSize();

    //Create scrollbar
    auto slider1 = CreateSlider(10, 10, 200, 30, ui->root, SLIDER_SCROLLBAR);
    slider1->SetRange(3, 10);

    //Create scrollbar
    auto slider2 = CreateSlider(10, 10 + 50, 200, 30, ui->root, SLIDER_SCROLLBAR);
    slider2->SetRange(1, 10);

    //Create trackbar
    auto slider3 = CreateSlider(10, 10 + 100, 200, 30, ui->root, SLIDER_TRACKBAR);
    slider3->SetRange(10, 20);
    slider3->SetValue(15);

    while (true)
    {
        const Event ev = WaitEvent();
        shared_ptr<Widget> widget;
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            widget = ev.source->As<Widget>();
            Print("Slider value:"  + String(widget->GetValue()));
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
