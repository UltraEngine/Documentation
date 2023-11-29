# Material.SetMetalness

This method sets the metallic property of a material.

## Syntax

- void **SetMetalness**(float metallic)

| Parameter | Description |
|---|---|
| metallic | metalness value between 0 and 1 |

## Remarks

Metallic materials use reflections for their color. Therefore you should call [World.SetEnvironmentMap](#) and assign specular and diffuse reflection maps when using metallic materials. If the reflection environment maps are not provided then metallic materials will appear very dark.

## Example

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/material_setroughness.jpg)

```csharp
using UltraEngine;

public class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = CreateWorld();

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -10);
        camera.SetFOV(50);

        var specmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/specular.dds");
        var diffmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/diffuse.dds");

        world.SetEnvironmentMap(specmap, EnvironmentMapType.ENVIRONMENTMAP_SPECULAR);
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.ENVIRONMENTMAP_DIFFUSE);

        var models = new List<Entity>();

        for (int x = 0; x < 4; ++x)
        {
            for (int y = 0; y < 4; ++y)
            {
                var mtl = CreateMaterial();
                mtl.SetRoughness((float)x / 3.0f);
                mtl.SetMetalness((float)y / 3.0f);

                var ball = CreateSphere(world);
                ball.SetPosition(x * 2.0f - 3.0f, y * 2.0f - 3.0f, 0);
                ball.SetMaterial(mtl);
                models.Add(ball);
            }
        }

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```