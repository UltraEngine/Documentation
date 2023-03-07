# Pixmap::ReadPixel

This method writes each pixel of the pixmap with the specified color.

## Syntax

- int **ReadPixel**(const int x, const int y)

| Parameter | Description |
|---|---|
| x | x position of the pixel to read |
| y | y position of the pixel to read |

## Returns

Returns the [RGBA](Rgba.md) color of the specified pixel.

This method will not work with compressed pixel formats.

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

    //Load a pixmap
    auto pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds");
    pixmap = pixmap->Convert(TEXTURE_RGBA);

    //Write pixel data
    for (int x = 0; x < pixmap->size.x; ++x)
    {
        for (int y = 0; y < pixmap->size.y; ++y)
        {
            int rgba = pixmap->ReadPixel(x, y);
            int r = Red(rgba);
            int g = 0;
            int b = 0;
            rgba = Rgba(r, g, b, 255);
            pixmap->WritePixel(x, y, rgba);
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
