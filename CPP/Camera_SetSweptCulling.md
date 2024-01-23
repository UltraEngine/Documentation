# Camera::SetSweptCulling

This method is used to set the camera swept culling mode. When swept culling is enabled, it can prevent objects from popping into view when the camera moves or turns.

## Syntax

- void **SetSweptCulling**(const bool mode)

| Parameter | Description |
|---|---|
| mode | set to true to enable swept culling |

## Example

```c++
#include "UltraEngine.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280*2, 720*2, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -4);
    camera->AddComponent<CameraControls>();

    bool swept = true;
    camera->SetSweptCulling(true);
    window->SetText("Swept culling enabled");

    //Create a light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    std::vector<shared_ptr<Entity> > boxes;

    //Create a model
    auto model = CreateBox(world);
    
    for (int x = 0; x < 100; ++x)
    {
        for (int y = 0; y < 5; ++y)
        {
            auto inst = model->Instantiate(world);
            inst->SetPosition(x * 2 - 100, y * 2 - 4, 8);
            boxes.push_back(inst);
        }
    }

    model = nullptr;

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->KeyHit(KEY_SPACE))
        {
            swept = not swept;
            camera->SetSweptCulling(swept);
            if (swept)
            {
                window->SetText("Swept culling enabled");
            }
            else
            {
                window->SetText("Swept culling disabled");
            }
        }
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
