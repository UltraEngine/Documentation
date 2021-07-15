# Widget::SetFontBold

This method sets the font weight to make text bold or normal.

## Syntax

- void **SetFontBold**(const bool bold)

| Parameter | Description |
| --- | --- |
| bold | font weight |

## Example
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create User Interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();

    auto label = CreateLabel("Font scale:", 10, 10, sz.x - 20, 30, ui->root);

    auto checkbox = CreateButton("Normal", 10, 40, sz.x - 20, 30, ui->root, BUTTON_CHECKBOX);

    auto textarea = CreateTextArea(10, 75, sz.x - 20, sz.y - 85, ui->root, TEXTAREA_WORDWRAP);
    textarea->SetText("The quick brown fox jumps over the lazy dog.");

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == checkbox)
            {
                textarea->SetFontBold(ev.data);
                if (ev.data)
                {
                    checkbox->SetText("Bold");
                }
                else
                {
                    checkbox->SetText("Normal");
                }
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
