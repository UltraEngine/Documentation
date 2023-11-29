# World.RecordStats

This method is used to enable or disable statistics recording. Statistics recording is disabled by default, so you need to enable it if you are displaying statistical information.

## Syntax

- void **RecordStats**(bool record)

| Parameter | Description |
|---|---|
| record | if set to true statistics recording is enabled, otherwise it is disabled |

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.Move(0, 0, -4);

        //Create light
        var light = CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(45, 35, 0);

        //Create model
        var box = CreateBox(world);

        //Enable stats recording
        world.RecordStats(true);

        //Setup 2D display
        var cam2d = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
        cam2d.SetRenderLayers(128);
        cam2d.SetClearMode(CLEAR_DEPTH);
        cam2d.SetPosition((float)framebuffer.size.x * 0.5f, (float)framebuffer.size.y * 0.5f);

        var font = LoadFont("Fonts/arial.ttf");
        var sprite = CreateSprite(world, font, "", 18);
        sprite.SetRenderLayers(128);
        sprite.SetPosition(2, framebuffer.size.y - font.GetHeight(18) - 2, 0);

        //Main loop
        while (window.Closed() == false)
        {
            //Display the framerate
            sprite.SetText("FPS: " + world.renderstats.framerate.ToString());

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```