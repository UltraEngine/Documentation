# LoadModel

This function loads a model from a file.

## Syntax

- shared_ptr<[Model](Model.md)\> **LoadModel**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Model](Model.md)\> **LoadModel**(shared_ptr<[Stream](Stream.md)\> stream, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to read from |
| stream | stream to read from |

## Returns

Returns the loaded model if successful, otherwise NULL is returned.

## Remarks

Ultra Engine natively supports glTF, OBJ, and Leadwerks MDL files. JPEG and PNG texture files are loaded using the FITextureLoader plugin.

## Example

This example loads and displays a model.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/loadmodel.jpg)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Plugin fpr texture loading
    auto plugin = LoadPlugin("Plugins/FITextureLoader");

    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();
    world->SetAmbientLight(0.25);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -2);
    camera->SetFOV(70);

    //Create a light
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetRange(-10, 10);
    light->SetColor(2);

    WString remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/";

    //Set environment for PBR materials
    auto specmap = LoadTexture(remotepath + "Materials/Environment/Storm/specular.dds");
    auto diffmap = LoadTexture(remotepath + "Materials/Environment/Storm/diffuse.dds");
    world->SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR);
    world->SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE);

    //Load a model
    // Battle Damaged Sci-fi Helmet - PBR by theblueturtle_
    // https://sketchfab.com/models/b81008d513954189a063ff901f7abfe4
    auto model = LoadModel(world, remotepath + "Models/DamagedHelmet.glb");
   
    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        model->Turn(0, 1, 0, true);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
