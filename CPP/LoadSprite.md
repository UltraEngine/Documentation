# LoadSprite

This function loads a texture, creates a sprite with the dimensions of the texture image, and applies the texture to the sprite material.

## Syntax

- shared_ptr<[Sprite](Sprite.md)\> **LoadSprite**(const [WString](WString.md)& path, const [LoadFlags](Constants.md#LoadFlags) flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| world | |
| path | | 
| stream | |
| flags | |

## Returns

If the texture is successfully loaded a new sprite is returned, otherwise NULL is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Create camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    //Create sprite
    auto sprite = LoadSprite(world, "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Sprites/nightraider.dds");
    sprite->SetPosition(-sprite->size.x * 0.5f, -sprite->size.y * 0.5f);
    sprite->mesh->material->SetAlphaMask(true);

    //Main loop
    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
