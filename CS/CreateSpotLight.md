**CreateSpotLight**

This function creates a new spot light.

## Syntax

- `Light` **CreateSpotLight**(`World` world)

| Parameter | Description |
|---|---|
| world | world to create the light in |

## Returns

Returns a new light.

## Example

```csharp
using System;
using Leadwerks;

public class MyGame : App
{
    public override bool Start()
    {
        var displays = Display.GetDisplays();

        var window = Window.Create("Leadwerks", 0, 0, 1280, 720, displays[0], Window.Style.Default);

        var world = World.Create();

        var camera = Camera.Create();
        camera.ClearColor = new Vec4(0.125f);
        camera.FOV = 70;
        camera.Move(0, 2, -2);

        var light = CreateSpotLight(world);
        light.Position = new Vec3(0, 1, 0);
        light.Color = new Vec4(2);

        var ground = Box.Create(world, 20, 1, 20);
        ground.Position = new Vec3(0, -0.5f, 0);
        ground.SetColor(new Vec4(0, 1, 0));

        while (!window.Closed && !window.KeyHit(Key.Escape))
        {
            world.Update();
            world.Render(framebuffer);
        }

        return true;
    }
    
    public static void Main(string[] args)
    {
        App app = new MyGame();
        app.Start();
    }
}
```
