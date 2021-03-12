# Widget::SetFontScale #
This method sets the font scale to make text relatively larger or smaller. The font scale will adjust with DPI scaling so it only needs to be set once.

## Syntax ##

- void **SetFontScale**(const float scale)

| Parameter | Description |
| --- | --- |
| scale | font scale to set (default is 1.0) |

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Load plugins
    auto plugin_svg = LoadPlugin("Plugins/SVG.*");

    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();

    auto label = CreateLabel("Font scale:", 10, 10, sz.x - 20, 30, ui->root);

    auto slider = CreateSlider(10, 40, sz.x - 20, 30, ui->root, SLIDER_TRACKBAR);
    slider->SetRange(1, 40);
    slider->SetValue(4);
    EmitEvent(EVENT_WIDGETACTION, slider, 4);

    auto textarea = CreateTextArea(10, 75, sz.x - 20, sz.y - 85, ui->root, TEXTAREA_WORDWRAP);
    textarea->SetText("The quick brown fox jumps over the lazy dog.");

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == slider)
            {
                textarea->SetFontScale(float(ev.data) / 4.0);
            }
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
