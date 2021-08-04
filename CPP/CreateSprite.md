# CreateSprite

This function creates a sprite that displays a solid or wireframe rectangle.

## Syntax

- shared_ptr<[Sprite](Sprite.md)\> **CreateSprite**(shared_ptr<[Canvas](Canvas.md)\> canvas, const int width, const int height, const bool wireframe = false, const radius = 0.0f)

| Parameter | Description |
| --- | --- |
| canvas | canvas to add the sprite to |
| width | width of the sprite, in pixels |
| height | height of the sprite, in pixels |
| wireframe | set to true for wireframe or false for solid |
| radius | corner radius, for rounded rectangles |

## Returns

Returns a new sprite that displays a rectangle.

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

    //Create sprite
    auto sprite = CreateSprite(canvas, 100, 100);
    sprite->SetPosition(10, 10);

    //Main loop
    while (window->Closed()==false and window->KeyHit(KEY_ESCAPE)==false)
    {
        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
