# CreatePixmap

This function creates a new pixmap with the specified size and format.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> **CreatePixmap**(const int width, const int height, const TextureFormat format = TEXTURE_RGBA, shared_ptr<[Buffer](Buffer.md)> pixeldata = NULL)

| Parameter | Description |
|---|---|
| width | width of the pixmap |
| height | height of the pixmap |
| format | pixmap pixel format, can be TEXTURE_RGBA, TEXTURE_RGB, TEXTURE_RG, TEXTURE_BGRA, TEXTURE_BGR, TEXTURE_RED, TEXTURE_RED16, or the compressed formats TEXTURE_BC1, TEXTURE_BC3, TEXTURE_BC5, or TEXTURE_BC7 |
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
    ui->background->SetPixmap(pixmap);

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
