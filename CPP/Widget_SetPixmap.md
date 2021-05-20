# Widget::SetPixmap #

This method sets a widget pixmap. It is preferable to use the [Widget::SetIcon](Widget_SetIcon.md) method if the vector image is available, we this will be resolution-independent.

## Syntax ##
- void **SetPixmap**(shared_ptr<[Pixmap](Pixmap.md)\> pixmap)

| Parameter | Description |
|---|---|
| pixmap | pixmap to set |

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
    auto pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds");

    //Show the pixmap
    ui->root->SetPixmap(pixmap);

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
