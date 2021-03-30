# CreatePixmap

This function creates a new pixmap with the specified size and format.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> CreatePixmap(const int width, const int height, const TextureFormat format = TEXTURE_RGBA, shared_ptr<[Buffer](Buffer.md)> pixeldata = NULL)

| Parameter | Description |
|---|---|
| width | width of the pixmap |
| height | height of the pixmap |
| format | pixmap pixel format |
| pixeldata | if specified the pixmap pixel data will be filled with the buffer contents |

## Returns

Returns a new pixmap object.

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
    pixmap->Fill(RGBA(0, 0, 255, 255));

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
