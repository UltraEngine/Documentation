# LoadFont

This function loads a font from a file path or stream.

## Syntax

- shared_ptr<[Font](Font.md)> **LoadFont**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Font](Font.md)> **LoadFont**(shared_ptr<[Stream](Stream.md)\> stream, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load |
| stream | stream to read from |
| flags | loading options, can be LOAD_DEFAULT or LOAD_NO_CACHE |

## Returns

Returns the loaded font, or NULL of the font could not be loaded.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

void main(const char* args, const int argc)
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125f);

    //Create sprite
    const int fontsize = 36;
    auto font = LoadFont("Fonts/arial.ttf");
    auto sprite = CreateSprite(world, font, "Hello, World!", fontsize);
    auto rect = CreateSprite(world, font->GetTextWidth("Hello, World!", fontsize), font->GetHeight(fontsize), true);

    //Center the text relative tot he camera
    camera->SetPosition(sprite->GetBounds().center);

    //Main loop
    while (!window->Closed() and !window->KeyHit(KEY_ESCAPE))
    {
        //Update world
        world->Update();

        //Render world
        world->Render(framebuffer, true);
    }
}
```
