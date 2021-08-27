# Widget::GetValue

This method gets the value of a slider widget.

## Syntax

- int **GetValue**()

## Returns

Returns the currently set widget value.

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
