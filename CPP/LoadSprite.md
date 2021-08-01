# LoadSprite

This function loads a texture, creates a sprite with the dimensions of the texture image, and applies the texture to the sprite material.

## Syntax

- shared_ptr<Sprite> **LoadSprite**(const [WString](WString.md)& path)
  
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
    auto window = CreateWindow("", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);
    
    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);
    
    //Create world
    auto world = CreateWorld();
    
    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0,0,1);
    
    //Create canvas
    auto canvas = CreateCanvas(camera);
    
    //Create sprite
    auto sprite = LoadSprite(canvas, "https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Sprites/nightraider.dds");
    sprite->MidHandle();
    sprite->SetPosition(framebuffer->size.x * 0.5, framebuffer->size.y * 0.5);
    
    //Main loop
    while (!window->Closed() and !window->KeyHit(KEY_ESCAPE))
    {
        sprite->Turn(1.0);
        world->Update();
        world->Render(framebuffer,true);
    }
    return 0;
}
  ```
