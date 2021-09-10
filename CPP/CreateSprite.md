# CreateSprite

This function creates a sprite that displays a rectangle or a string of text.

## Syntax

- shared_ptr<[Sprite](Sprite.md)\> **CreateSprite**(shared_ptr<[World](World.md)\> world, const float width, const float height, const bool wireframe = false, const float radius = 0)
- shared_ptr<[Sprite](Sprite.md)\> **CreateSprite**(shared_ptr<[World](World.md)\> world, const [WString](WString.md)& text, shared_ptr<[Font](Font.md)\> font, const int size)

| Parameter | Description |
| --- | --- |
| world | canvas to add the sprite to |
| width | width of the sprite, in pixels |
| height | height of the sprite, in pixels |
| wireframe | set to true for wireframe or false for solid |
| radius | corner radius, for rounded rectangles |
| text | text to display |
| font | font to render text with |
| size | font size |

## Returns

Returns a new sprite object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    
    //Create sprite
    auto sprite = CreateSprite(world, 100, 100);
   
    //Main loop
    while (window->Closed()==false and window->KeyHit(KEY_ESCAPE)==false)
    {
        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
