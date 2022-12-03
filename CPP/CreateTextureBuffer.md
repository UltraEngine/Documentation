# CreateTextureBuffer

This function creates a new texture buffer, for render-to-texture operations.

## Syntax

- shared_ptr<[TextureBuffer](TextureBuffer.md)> **CreateTextureBuffer**(const int width, const int height, const int colorattachments = 1, const bool depthattachment = true)

| Parameter | Description |
|---|---|
| width, height | dimensions of the texture buffer |
| colorattachments | number of color textures to add, between 0 and 7 |
| depthattachment | set to true to add a depth texture |

## Returns

Returns a new texture buffer object.

## Example

**WORK IN PROGRESS**

**WARNING: THIS WILL CRASH YOUR GRAPHICS DRIVER**

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -10);
    camera->SetFOV(70);

    auto specmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/specular.dds");
    world->SetEnvironmentMap(specmap, ENVIRONMENTMAP_BACKGROUND);

    auto texbuffer = CreateTextureBuffer(512, 512, 0, true);
    auto cam2 = CreateCamera(world);
    cam2->SetRotation(-90, 0, 0);
    cam2->SetRenderTarget(texbuffer);
    auto box = CreateBox(world);
    auto mtl = CreateMaterial();
    mtl->SetTexture(texbuffer->GetColorAttachment());
    box->SetMaterial(mtl);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
