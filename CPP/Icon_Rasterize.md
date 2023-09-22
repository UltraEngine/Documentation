# Icon::Rasterize

This method generates a pixmap from a vector image. A scaling value can be used to create the pixmap at any magnification level.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> **Rasterize**(const float scale = 1.0f, const bool cached = true)

| Parameter | Description |
| --- | --- |
| scale | magnification value to create scaled versions of the image |
| cached | if set to true the routine will search for a cached pixmap at the specified scale, otherwise a new pixmap will always be generated |

## Returns

Returns a pixmap at the specified scale.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create a pixmap
    auto icon = LoadIcon("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Logos/23.svg");

    //Generate a pixmap
    auto pixmap = icon->Rasterize(1.0);

    //Show the icon
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
