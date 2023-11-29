```csharp
using UltraEngine;

public class Game
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        //Create a world
        var world = CreateWorld();

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create light
        var light = CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetRotation(15, 15, 0);
        light.SetColor(2);

        //Create camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -3);
        camera.SetFOV(70);

        //Create scenery
        var box = CreateBox(world);

        var cone = CreateCone(world);
        cone.SetPosition(1.25, 0, 0);
        cone.SetColor(0, 0, 1);

        var sphere = CreateSphere(world);
        sphere.SetPosition(-1.25, 0, 0);
        sphere.SetColor(1, 0, 0);

        //Create camera and texture buffer
        var texbuffer = CreateTextureBuffer(256, 256);
        var cam2 = CreateCamera(world);
        cam2.SetClearColor(1, 1, 1);
        cam2.SetRenderTarget(texbuffer);

        //Create material
        var mtl = CreateMaterial();
        var tex = texbuffer.GetColorAttachment();
        mtl.SetTexture(tex);
        box.SetMaterial(mtl);
        cone.SetMaterial(mtl);
        sphere.SetMaterial(mtl);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KEY_ESCAPE))
        {
            //Orient the texturebuffer camera
            cam2.SetPosition(0, 0, 0);
            cam2.Turn(0, 1, 0);
            cam2.Move(0, 0, -3);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```