# Font::GetHeight

This method returns the font's line height.

## Syntax

- int **GetHeight**(const int size)

| Parameter | Description |
|---|---|
| size | font size |

## Returns

Returns the font's line height. For most fonts, this will be the distance between the base of a capital letter and its maximum height, known as the font *ascent*.

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
