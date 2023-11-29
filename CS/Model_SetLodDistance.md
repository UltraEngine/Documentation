# Model.SetLodDistance

This method sets the base Lod distance factor.

```csharp
public void SetLodDistance(float basefactor)
```

| Parameter | Description |
|---|---|
| basefactor | distance factor for Lod changes |

## Remarks

Each level of detail above zero will be shown when the distance from the center of the model's global bounding box to the camera exceeds the level's distance, as calculated by this equation:

distance = (2 ^ (level - 1)) * basefactor

For example, if basefactor is 10 then Lod 1 will be shown at a distance of 10 meters, Lod 2 will be shown at a distance of 20 meters, and Lod 3 will be shown at a distance of 40 meters.

## Example

```csharp
using System;
using Ultraviolet;
using Ultraviolet.BASS;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Ultraviolet.GetDisplays();

        //Create a window
        var window = Ultraviolet.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = Ultraviolet.CreateWorld();

        //Create a framebuffer
        var framebuffer = Ultraviolet.CreateFramebuffer(window);

        //Create a camera
        var camera = Ultraviolet.CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -1);
        camera.SetWireframe(true);
        camera.SetFOV(70);

        //Create a light
        var light = Ultraviolet.CreateBoxLight(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);
        light.SetColor(2);

        //Create a model
        var model = Ultraviolet.CreateSphere(world, 0.5f, 64);
        model.SetColor(0, 1, 0);

        //Add Lod
        var temp = Ultraviolet.CreateSphere(world, 0.5f, 32);
        model.AddLod();
        model.AddMesh(temp.lods[0].meshes[0], 1);

        //Add Lod
        temp = Ultraviolet.CreateSphere(world, 0.5f, 16);
        model.AddLod();
        model.AddMesh(temp.lods[0].meshes[0], 2);

        //Add Lod
        temp = Ultraviolet.CreateSphere(world, 0.5f, 8);
        model.AddLod();
        model.AddMesh(temp.lods[0].meshes[0], 3);
        temp = null;

        model.SetLodDistance(1.0f);

        var z = camera.position.Z;

        //Main loop
        while (window.Closed() == false && window.KeyDown(KeyCode.KEY_ESCAPE) == false)
        {
            //Move the camera forward and backwards to change detail levels
            if (window.KeyDown(KeyCode.KEY_UP)) z += 0.005f;
            if (window.KeyDown(KeyCode.KEY_DOWN)) z -= 0.005f;
            z = MathHelper.Min(-1.0f, z);
            camera.SetPosition(0, 0, z);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```