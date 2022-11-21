# Model::Animate

This method causes an animation sequence to play.

## Syntax
* void **Animate**(const int sequence = 0, const float speed = 1.0f, const int blendtime = 250, const AnimationMode mode = ANIMATION_LOOP)
* void **Animate**(const [WString](WString.md)& sequence, const float speed = 1.0f, const int blendtime = 250, const AnimationMode mode = ANIMATION_LOOP)

| Parameter | Description |
| ------ | ------ |
| sequence | animation sequence index or name. Sequence names are not case-sensitve |
| blendtime | animation transition time, in milliseconds |
| mode | animation playback mode. This can be ANIMATION_LOOP, ANIMATION_ONCE, or ANIMATION_STOP |

## Example

This example loads and displays an animated model.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/model_animate.jpg)

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

    //Main loop
    while (window->Closed() == false)
    {
        model->Turn(0, 0.2, 0);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
