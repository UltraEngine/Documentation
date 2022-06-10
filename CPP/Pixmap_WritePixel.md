# Pixmap::WritePixel

This method writes each pixel of the pixmap with the specified color. This command is safe to call from multiple threads, as long as they do not write to the same pixels.

## Syntax

- void **WritePixel**(const int x, const int y, const int color)

| Parameter | Description |
|---|---|
| x | x position of the pixel to write |
| y | y position of the pixel to write |
| color | [RGBA](RGBA.md) color |

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
    auto pixmap = CreatePixmap(512, 512);
    
    //Write pixel data
    for (int x = 0; x < 512; ++x)
    {
        for (int y = 0; y < 512; ++y)
        {
            pixmap->WritePixel(x, y, RGBA(255 * float(x) / 512.0f, 255 * float(y) / 512.0f, 0, 255));
        }
    }

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
