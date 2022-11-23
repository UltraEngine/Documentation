# Camera::SetTessellation

This method sets the desired polygon edge size for tessellated materials.

## Syntax

- void **SetTessellation**(const int polygonsize)

| Parameter | Description |
| --- | --- |
| polygonsize | desired polygon edge length, in screen pixels |

## Remarks

A *polygonsize* value of 4 is suitable for high quality tessellation. If it is zero then tessellation will be disabled.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Load plugin for texture loading
    auto plugin = LoadPlugin("Plugins/Basis.*");

    //Get the primary display
    auto displaylist = GetDisplays();
    auto display = displaylist[0];
    Vec2 displayscale = display->GetScale();

    //Create a window
    auto window = CreateWindow(display, "Tessellation", 0, 0, 1280 * displayscale.x, 720 * displayscale.y);

    //Create a rendering framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();
    world->SetSkybox("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Sky/sunset.basis");
    world->SetAmbientLight(0);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->Move(0, 0, -0.75);
    camera->SetClearColor(0.25);
    camera->SetTessellation(8); //Tessellated primitives are n pixels wide(zero or less disables tessellation)

    //Create a light
    auto  light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(35, -55, 0);
    light->SetColor(1.2);

    //Display material
    auto model = CreateQuadSphere(world, 0.5, 8, true);
    auto mtl = LoadMaterial("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/rocky_soil.mtl");
    model->SetMaterial(mtl);

    //Main loop
    while (window->Closed() == false)
    {
        model->Turn(0, 0.1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
