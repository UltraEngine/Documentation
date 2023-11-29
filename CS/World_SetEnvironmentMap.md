# World.SetEnvironmentMap

This method sets the world skybox or specular and diffuse reflection maps.

## Syntax 

```csharp
void SetEnvironmentMap(Texture texture, EnvironmentMap id)
```

| Parameter | Description |
|---|---|
| texture | cubemap to set |
| id | environment map ID, may be ENVIRONMENT_BACKGROUND, ENVIRONMENT_SPECULAR, or ENVIRONMENT_DIFFUSE

## Remarks

For best results, environment maps should be generated from HDR images using the [glTF IBL Sampler](https://github.com/KhronosGroup/glTF-IBL-Sampler) tool from Khronos.

You can access a collection of ready-to-use environment maps [here](https://github.com/UltraEngine/Assets/tree/main/Materials/Environment).

## Example

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = World.CreateWorld();

        //Create a framebuffer
        var framebuffer = Framebuffer.CreateFramebuffer(window);

        //Create a camera
        var camera = Camera.CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -2);

        //Set environment maps
        const string remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets";
        var specmap = Texture.LoadTexture(remotepath + "/Materials/Environment/Storm/specular.dds");
        var diffmap = Texture.LoadTexture(remotepath + "/Materials/Environment/Storm/diffuse.dds");
        world.SetEnvironmentMap(specmap, EnvironmentMap.ENVIRONMENTMAP_BACKGROUND);
        world.SetEnvironmentMap(specmap, EnvironmentMap.ENVIRONMENTMAP_SPECULAR);
        world.SetEnvironmentMap(diffmap, EnvironmentMap.ENVIRONMENTMAP_DIFFUSE);

        var mtl = Material.CreateMaterial();
        mtl.SetRoughness(0.25);
        mtl.SetMetalness(0.5);

        var ball = Sphere.CreateSphere(world);
        ball.SetMaterial(mtl);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```