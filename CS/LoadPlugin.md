# LoadPlugin

This function loads a plugin module. The plugin's functionality will be available immediately. When the plugin object goes out of scope it will be deleted, and its functionality will no longer be available.

## Syntax

- `Plugin LoadPlugin`(string path, LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
| --------- | ----------- |
| path      | file path of the module to load |
| flags     | optional load settings |

## Remarks

The file extension of plugin modules varies by platform. You can use an asterisk (\*) for the file extension and the engine will select the correct file extension based on the current platform.

## Example

![LoadPlugin Example](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/loadplugin.jpg)

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = Displays.GetDisplays();

        // Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        // Create a world
        var world = World.Create();
        world.SetAmbientLight(0);

        // Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        // Load FreeImage plugin
        var plg = LoadPlugin("Plugins/FITextureLoader");

        // Load model
        // Cyber Samurai by Khoa Minh: https://sketchfab.com/3d-models/cyber-samurai-26ccafaddb2745ceb56ae5cfc65bfed5
        var model = Model.LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/cyber_samurai.glb");
        model.Turn(0, 180, 0, true);

        // Environment maps
        var specmap = Texture.LoadTexture("https://github.com/UltraEngine/Assets/raw/main/Materials/Environment/footprint_court/specular.dds");
        var diffmap = Texture.LoadTexture("https://github.com/UltraEngine/Assets/raw/main/Materials/Environment/footprint_court/diffuse.dds");
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.ENVIRONMENTMAP_BACKGROUND);
        world.SetEnvironmentMap(specmap, EnvironmentMapType.ENVIRONMENTMAP_SPECULAR);
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.ENVIRONMENTMAP_DIFFUSE);

        // Create a camera    
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 1.4, -1);
        camera.SetFov(70);
        camera.AddPostEffect(LoadPostEffect("Shaders/PostEffects/FXAA.json"));
        
        // Camera controls
        var actor = Actor.Create(camera);
        actor.AddComponent<CameraControls>();

        // Create light
        var light = BoxLight.Create(world);
        light.SetRange(-10, 10);
        light.SetArea(15, 15);
        light.SetRotation(45, 35, 0);
        light.SetColor(1.2);

        // Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```