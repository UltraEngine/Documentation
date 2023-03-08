# Widget::SetColor

This method sets a widget's color value.

## Syntax

- void **SetColor**(const float r, const float g, const float b, const float a = 1.0f, const WidgetColor index = WIDGETCOLOR_BACKGROUND)
- void **SetColor**(const [Vec4](Vec4.md)& color, const WidgetColor index = WIDGETCOLOR_BACKGROUND)

| Parameter | Description |
| --- | --- |
| r | red component of the color to set |
| g | green component of the color to set |
| b | blue component of the color to set |
| a | alpha component of the color to set |
| color | color to set |
| index | color index |

## Remarks

 The color index can be any of the following values:

- WIDGETCOLOR_BACKGROUND
- WIDGETCOLOR_SUNKEN
- WIDGETCOLOR_RAISED
- WIDGETCOLOR_BORDER
- WIDGETCOLOR_FOREGROUND
- WIDGETCOLOR_SELECTION
- WIDGETCOLOR_HIGHLIGHT
- WIDGETCOLOR_SELECTEDTEXT
- WIDGETCOLOR_SLIDERARROW
- WIDGETCOLOR_SLIDERTRACK
- WIDGETCOLOR_SLIDERTRACKHOVERED
- WIDGETCOLOR_MENUBORDER
- WIDGETCOLOR_POPUP

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

    //Create widget
    auto panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui->root);
    panel->SetColor(0, 0, 0, 1);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
