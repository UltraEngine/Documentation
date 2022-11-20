# Bone::Turn

This method smoothly adds rotation to the current rotation.

## Syntax

- void **Turn**(const float pitch, const float yaw, const float roll)
- void **Turn**(const [Vec3](Vec3.md)& rotation)

| Parameter | Description |
|---|---|
| rotation, (pitch, yaw, roll) | rotation to apply |
| global | if set to true rotation is relative to the skeleton, otherwise it is relative to the bone's parent |

## Remarks

To combine programmatic movement with animation, this method should be called after [World::Update](World_Update.md) and before [World::Render](World_Render.md).

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

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetFOV(70);
    camera->Move(0, 2, -8);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetRange(-10, 10);

    //Load FreeImage plugin
    auto plugin = LoadPlugin("Plugins/FITextureLoader");

    //Load a model
    auto model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/Fox.glb");
    model->SetScale(0.05);
    model->Animate(1);
    model->SetRotation(0, -90, 0);

    auto neck = model->skeleton->FindBone("b_Neck_04");
    Vec3 rotation;

    //Main loop
    while (window->Closed() == false)
    {
        world->Update();

        rotation.y = Cos(float(Millisecs()) / 10.0f) * 65.0f;
        neck->Turn(rotation);

        world->Render(framebuffer);
    }
    return 0;
}
```
