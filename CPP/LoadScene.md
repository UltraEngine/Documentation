# LoadScene

This command loads a scene from a file path or stream.

## Syntax

- shared_ptr<[Scene](Scene.md)> **LoadScene**(shared_ptr<[World](World.md)> world, const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Scene](Scene.md)> **LoadScene**(shared_ptr<[World](World.md)> world, shared_ptr<[Stream](Stream.md)> stream, shared_ptr<[Stream](Stream.md)> binstream, const LoadFlags flags = LOAD_DEFAULT)

## Returns

If the scene is successfully loaded a new scene object is returned, otherwise NULL is returned.

## Remarks

This feature is in continued development and its behavior may change somewhat in future updates.

## Example

This example saves the starting scene and reloads it when the space key is pressed.

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
    camera->SetPosition(0, 1, -4);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetArea(15, 15);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Create the ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);
    
    //Create a scene
    auto scene = std::make_shared<Scene>();
    scene->entities.push_back(ground);
    scene->entities.push_back(light);
    ground = NULL;
    light = NULL;

    //Add some boxes
    for (int n = 0; n < 10; ++n)
    {
        auto box = CreateBox(world);
        box->SetColor(0, 0, 1);
        box->SetPosition(Random(-5,5), Random(5, 10), Random(-5, 5));
        box->SetMass(1);
        scene->entities.push_back(box);
    }

    //Save the starting scene to memory
    auto stream = CreateBufferStream();
    auto binstream = CreateBufferStream();
    scene->Save(stream,binstream);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Reload the starting scene when space key is pressed
        if (window->KeyHit(KEY_SPACE))
        {
            stream->Seek(0);
            binstream->Seek(0);
            scene = LoadScene(world, stream, binstream);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
