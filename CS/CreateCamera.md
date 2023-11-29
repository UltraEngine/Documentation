```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create a window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = Engine.CreateWorld();

        //Create a framebuffer
        var framebuffer = Engine.CreateFramebuffer(window);

        //Create a camera
        var camera = Engine.CreateCamera(world);
        camera.SetClearColor(0.125f);
        
        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCodes.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```