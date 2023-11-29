```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create world
        var world = Engine.CreateWorld();

        //Create framebuffer
        var framebuffer = Engine.CreateFramebuffer(window);

        //Create a camera
        var camera = Engine.CreateCamera(world, CameraFlags.PROJECTION_ORTHOGRAPHIC);
        camera.SetClearColor(0.125);

        while (!window.Closed() && !window.KeyDown(KeyCodes.KEY_ESCAPE))
        {
            while (Engine.PeekEvent())
            {
                var e = Engine.WaitEvent();
                switch (e.id)
                {
                    case EventFlags.EVENT_STARTRENDERER:
                        if (e.data == 1)
                        {
                            //Display the graphics device name
                            window.SetText(window.text + " - " + e.text);
                        }
                        else
                        {
                            //Show error message
                            Engine.Notify("Renderer failed to initialize.\n\n" + e.text, "Error", true);
                            return 0;
                        }
                        break;
                    case EventFlags.EVENT_QUIT:
                        return 0;
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
        return 0;
    }
}
```