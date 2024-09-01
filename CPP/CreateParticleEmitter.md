# CreateParticleEmitter

This function creates a new particle emitter entity.

## Syntax

- shared_ptr<[ParticlesEmitter](ParticlesEmitter.md)> **CreateParticleEmitter**(shared_ptr<[World](World.md)> world, const int particles = 50)

| Parameter | Description |
|---|---|
| world | world to create the entity in |
| particles | number of particles, must be one or greater |

## Returns

Returns a new particle emitter.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CLIENTCOORDS | WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetPosition(0, 4, -8);

    //Create a particle emitter with 50 particles
    auto emitter = CreateParticleEmitter(world, 50);
    emitter->SetMaterial(LoadMaterial("Materials/Particles/default.mat"));

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
