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
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR);

        //Create a world
        var world = UltraEngine.CreateWorld();

        //Create a framebuffer
        var framebuffer = UltraEngine.CreateFramebuffer(window);

        //Create light
        var light = UltraEngine.CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetRotation(15, 15, 0);
        light.SetColor(2);

        //Create camera
        var camera = UltraEngine.CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -3);
        camera.SetFOV(70);

        //Create scenery
        var box = UltraEngine.CreateBox(world);

        var cone = UltraEngine.CreateCone(world);
        cone.SetPosition(1.25, 0, 0);
        cone.SetColor(0, 0, 1);

        var sphere = UltraEngine.CreateSphere(world);
        sphere.SetPosition(-1.25, 0, 0);
        sphere.SetColor(1, 0, 0);

        //Create camera and texture buffer
        var texbuffer = UltraEngine.CreateTextureBuffer(256, 256);
        var cam2 = UltraEngine.CreateCamera(world);
        cam2.SetClearColor(1, 1, 1);
        cam2.SetRenderTarget(texbuffer);
        cam2.SetRealtime(false);

        //Create material
        var mtl = UltraEngine.CreateMaterial();
        var tex = texbuffer.GetColorAttachment();
        mtl.SetTexture(tex);
        box.SetMaterial(mtl);
        cone.SetMaterial(mtl);
        sphere.SetMaterial(mtl);

        //Main loop
        while (!window.Closed() && !window.KeyDown(UltraEngine.KEY_ESCAPE))
        {
            //Orient the texturebuffer camera
            cam2.SetPosition(0, 0, 0);
            cam2.Turn(0, 1, 0);
            cam2.Move(0, 0, -3);

            //Press the space key to redraw the texture buffer camera
            if (window.KeyHit(UltraEngine.KEY_SPACE))
                cam2.Render();

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```