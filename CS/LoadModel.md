# LoadModel

This function loads a model from a file.

## Syntax

- [Model](Model.md) **LoadModel**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path, LoadFlags flags = LOAD_DEFAULT)
- [Model](Model.md) **LoadModel**(stream: [Stream](Stream.md), LoadFlags flags = LOAD_DEFAULT)

### Parameters

| Parameter | Description |
|---|---|
| path | file path to read from |
| stream | stream to read from |

## Returns

Returns the loaded model if successful, otherwise nil is returned.

```c#
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        // Get the displays
        var displays = GetDisplays();

        // Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        // Create a world
        var world = CreateWorld();
        world.SetAmbientLight(0);

        // Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        // Load FreeImage plugin
        var plg = LoadPlugin("Plugins/FITextureLoader");

        // Load model
        // Cyber Samurai by Khoa Minh: https://sketchfab.com/3d-models/cyber-samurai-26ccafaddb2745ceb56ae5cfc65bfed5
        var model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/cyber_samurai.glb");
        model.Turn(0, 180, 0, true);

        // Environment maps
        var specmap = LoadTexture("https://github.com/UltraEngine/Assets/raw/main/Materials/Environment/footprint_court/specular.dds");
        var diffmap = LoadTexture("https://github.com/UltraEngine/Assets/raw/main/Materials/Environment/footprint_court/diffuse.dds");
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.ENVIRONMENTMAP_BACKGROUND);
        world.SetEnvironmentMap(specmap, EnvironmentMapType.ENVIRONMENTMAP_SPECULAR);
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.ENVIRONMENTMAP_DIFFUSE);

        // Create a camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 1.4, -1);
        camera.SetFov(70);
        camera.AddPostEffect(LoadPostEffect("Shaders/PostEffects/FXAA.json"));

        // Add camera controls
        camera.AddComponent<CameraControls>();

        // Create light
        var light = CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetArea(15, 15);
        light.SetRotation(45, 35, 0);
        light.SetColor(1.2);

        // Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```
