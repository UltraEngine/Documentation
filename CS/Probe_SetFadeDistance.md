# Probe.SetFadeDistance

This method sets the probe volume edge fade. This can be used to make specified edges of the probe fade in more gradually.

## Syntax

- void **SetFadeDistance**(float distance, CubemapFace face)

| Parameter | Description |
|---|---|
| distance | fade distance |
| face | cubemap face, can be CubemapFace.PositiveX, CubemapFace.NegativeX, CubemapFace.PositiveY, CubemapFace.NegativeY, CubemapFace.PositiveZ, or CubemapFace.NegativeZ |

## Example

![Probe](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/probe.jpg)

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        const string remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets";
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.CENTER | WindowFlags.TITLEBAR);

        //Create framebuffer
        var framebuffer = new Framebuffer(window);
        framebuffer.GetSize();

        //Create world
        var world = new World();
        world.SetAmbientLight(0.05);

        //Set environment maps
        var specmap = Texture.Load(remotepath + "/Materials/Environment/Storm/specular.dds");
        var diffmap = Texture.Load(remotepath + "/Materials/Environment/Storm/diffuse.dds");
        world.SetEnvironmentMap(specmap, EnvironmentMapType.Specular);
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.Diffuse);

        //Create light
        var light = new DirectionalLight(world);
        light.SetRotation(25, 315, 0);

        //Create camera
        var camera = new Camera(world);
        camera.SetFOV(70);
        camera.SetPosition(8, 2.5, 0);
        camera.SetClearColor(0.125f);

        //Create the scene
        var wall = new Box(world, 10, 5, 0.5);
        wall.SetPosition(0, 2.5, 4.75);
        wall.SetColor(0, 1, 1);

        var wall2 = new Box(world, 10, 5, 0.5);
        wall2.SetPosition(0, 2.5, -4.75);
        wall2.SetColor(1, 0, 0);

        var wall3 = new Box(world, 0.5, 5, 9);
        wall3.SetPosition(-4.75, 2.5, 0);

        var floor = new Box(world, 20, 1, 20);
        floor.SetPosition(0, -0.5f, 0);

        var ceil = new Box(world, 10, 0.5f, 10);
        ceil.SetPosition(0, 5.25, 0);

        var drag = Model.Load(world, remotepath + "/Models/Stanford/dragon.glb");
        drag.SetScale(0.1f);
        drag.SetColor(1, 1, 1, 1, true);
        drag.SetReflection(false);
        var mtl = new Material();
        mtl.SetMetalness(0.75);
        mtl.SetRoughness(0);
        drag.SetMaterial(mtl, true);

        //Create environment probe
        var probe = new Probe(world);
        probe.SetScale(9.5, 5, 9.5);
        probe.SetPosition(0, 2.5, 0);
        probe.SetFadeDistance(1, CubemapFace.PositiveX);
        probe.SetFadeDistance(0, CubemapFace.NegativeX);
        probe.SetFadeDistance(0, CubemapFace.PositiveY);
        probe.SetFadeDistance(0, CubemapFace.NegativeY);
        probe.SetFadeDistance(0, CubemapFace.PositiveZ);
        probe.SetFadeDistance(0, CubemapFace.NegativeZ);

        //Camera controls
        var actor = new Actor(camera);
        actor.AddComponent<CameraControls>();

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.ESCAPE))
        {
            world.Update();
            world.Render(framebuffer, true);
        }
    }
}
```