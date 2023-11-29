# Camera.SetRenderTarget

This method sets a camera to render to a texture buffer.

## Syntax

- **void** SetRenderTarget(**TextureBuffer** texturebuffer)

| Parameter | Description |
|---|---|
| texturebuffer | texture buffer to render to |

## Example

```csharp
using System;
using Ultraviolet;
using Ultraviolet.Graphics;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Ultraviolet.GetDisplays();

        //Create a window
        var window = Ultraviolet.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowOptions.Centered | WindowOptions.Titled);

        //Create a world
        var world = Ultraviolet.CreateWorld();

        //Create a framebuffer
        var framebuffer = Ultraviolet.CreateFramebuffer(window);

        //Create light
        var light = Ultraviolet.CreateBoxLight(world);
        light.Range = new Vector2(-10, 10);
        light.Rotation = new Vector3(15, 15, 0);
        light.Color = Color.White * 2;

        //Create camera
        var camera = Ultraviolet.CreateCamera(world);
        camera.ClearColor = Color.Purple;
        camera.Position = new Vector3(0, 0, -3);
        camera.FieldOfView = 70;

        //Create scenery
        var box = Ultraviolet.CreateBox(world);

        var cone = Ultraviolet.CreateCone(world);
        cone.Position = new Vector3(1.25f, 0, 0);
        cone.Color = Color.Blue;

        var sphere = Ultraviolet.CreateSphere(world);
        sphere.Position = new Vector3(-1.25f, 0, 0);
        sphere.Color = Color.Red;

        //Create camera and texture buffer
        var texbuffer = Ultraviolet.CreateTextureBuffer(256, 256);
        var cam2 = Ultraviolet.CreateCamera(world);
        cam2.ClearColor = Color.White;
        cam2.SetRenderTarget(texbuffer);

        //Create material
        var mtl = Ultraviolet.CreateMaterial();
        var tex = texbuffer.ColorAttachment;
        mtl.Texture = tex;
        box.Material = mtl;
        cone.Material = mtl;
        sphere.Material = mtl;

        //Main loop
        while (!window.Closed && !Ultraviolet.GetInput().GetKeyboard().IsDown(Key.Escape))
        {
            //Orient the texturebuffer camera
            cam2.Position = Vector3.Zero;
            cam2.Turn(new Vector3(0, 1, 0));
            cam2.Move(new Vector3(0, 0, -3));

            world.Update(Ultraviolet.GetFrameTime());
            world.Render(framebuffer);
        }
    }
}
```