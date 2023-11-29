# Entity.AlignToVector

This method will align one axis of an entity along a specified vector in global space.

## Syntax

- void **AlignToVector**(float x, float y, float z, int axis = 2, float rate = 1.0, float roll = 0.0)
- void **AlignToVector**(xVec3 v, int axis = 2, float rate = 1.0, float roll = 0.0)

| Parameter | Description |
| --- | --- |
| v, (x, y, z) | alignment vector  |
| axis | entity axis to align to the vector (0, 1, or 2) |
| rate | can be used to gradually align vector |
| roll | rotation around axis |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = UltraEngine.CreateFramebuffer(window);

        //Create a world
        var world = UltraEngine.CreateWorld();

        //Create a camera
        var camera = UltraEngine.CreateCamera(world);
        camera.SetPosition(0, 0, -2);
        camera.SetClearColor(0.125);

        //Create light
        var light = UltraEngine.CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create model
        var box = UltraEngine.CreateBox(world);
        box.SetColor(0, 0, 1);

        while (!window.Closed() && !window.KeyDown(KEY_ESCAPE))
        {
            //Move the mouse to point the box
            var mousepos = window.GetMousePosition();
            Vec3 dir;
            dir.x = mousepos.x - framebuffer.size.x / 2;
            dir.y = -(mousepos.y - framebuffer.size.y / 2);
            box.AlignToVector(dir, 1, 0.1);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```