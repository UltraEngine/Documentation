# Pixmap::Convert

- shared_ptr<[Pixmap](Pixmap.md)\> **Convert**(const TextureFormat format)

| Parameter | Description |
|---|---|
| format | pixel format to convert to |

## Returns

Returns a pixmap with the new pixel format if successful, otherwise NULL is returned.

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
    
    //Convert to single red channel
    pixmap = pixmap->Convert(TEXTURE_RED);
    
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
