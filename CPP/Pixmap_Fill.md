# Pixmap::Fill

This method writes each pixel of the pixmap with the specified color.

## Syntax

- void **Fill**(const int color)

| Parameter | Description |
|---|---|
| color | [RGBA](Rgba.md) color |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create a pixmap
    auto pixmap = CreatePixmap(512,512);
    pixmap->Fill(RGBA(0, 0, 0, 255));

    //Show the pixmap
    ui->root->SetPixmap(pixmap);

    auto button = CreateButton("Modify Pixmap", 10, 10, 100, 30, ui->root);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == button)
            {
                //Fill the pixmap with a new color
                pixmap->Fill(Rgba(Random(255), Random(255), Random(255), 255));

                //Redraw the panel
                ui->root->Paint();
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
