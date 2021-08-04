# CreateText

This function creates a new sprite that displays a string of text.

## Syntax

- shared_ptr<[Canvas](Canvas.md)\> **CreateText**(shared_ptr<[Canvas](Canvas.md)\> canvas, const [WString](WString.md)& text, shared_ptr<[Font](Font.md)\> font, const int size)

| Parameter | Description |
|---|---|
| canvas | canvas to create the sprite on |
| text | text to display |
| font | font to render text with |
| size | font size |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0, 0, 1);

    //Create canvas
    auto canvas = CreateCanvas(camera);

    //Load a font
    auto font = LoadFont("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Fonts/FreeSans.ttf");

    //Create sprite
    auto text = CreateText(canvas, font, "Hello, world!", 72);
    text->SetPosition((framebuffer->size.x - text->size.x) / 2, (framebuffer->size.y - text->size.y) / 2);
    
    //Main loop
    while (window->Closed()==false and window->KeyHit(KEY_ESCAPE)==false)
    {
        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
