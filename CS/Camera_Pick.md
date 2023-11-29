# Camera.Pick

This method performs a raycast at the specified screen coordinate.

## Syntax

- [PickInfo](PickInfo.md) Pick(FrameBuffer framebuffer, float x, float y, float radius = 0.0f, bool closest = false, bool filter(Entity entity, Object extra) = null, Object extra = null)
- [PickInfo](PickInfo.md) Pick(FrameBuffer buffer, Vec2 screencoord, float radius = 0.0f, bool closest = false, bool filter(Entity entity, Object extra) = null, Object extra = null)

| Parameter | Description |
| ----- | ----- |
| framebuffer | framebuffer to test with |
| screencoord, (x, y) | screen coordinate to pick |
| radius | pick sphere radius |
| closest | if true the closest point will be determined |
| filter | optional callback to filter objects |
| extra | extra value to send to filter callback |

## Returns

Returns a [PickInfo](PickInfo.md) structure. If the *success* member of the structure is true an object was hit, otherwise it will be false.

If a filter callback is provided it will be called for each entity that is evaluated. If the callback returns true the entity will be tested, otherwise it will be skipped.
  
## Example

```csharp
using UltraEngine;

public class Program
{
    static bool PickFilter(Entity entity, Object extra)
    {
        return true;
    }

    public static void Main()
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WindowCenter | WindowFlags.WindowTitlebar);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = FrameBuffer.Create(window);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-10, 10);
        light.SetRotation(15, 15, 0);
        light.SetColor(2);

        //Create camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 0, -3);
        camera.SetFov(70);

        //Create scenery
        var box = Box.Create(world);

        var cone = Cone.Create(world);
        cone.SetPosition(1.25f, 0, 0);

        var sphere = Sphere.Create(world);
        sphere.SetPosition(-1.25f, 0, 0);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            //Click on an object to change its color
            if (window.MouseHit(MouseButton.MOUSE_LEFT))
            {
                box.SetColor(1, 1, 1);
                cone.SetColor(1, 1, 1);
                sphere.SetColor(1, 1, 1);
                var mousepos = window.GetMousePosition();
                var pick = camera.Pick(framebuffer, mousepos.X, mousepos.Y, 0, true, PickFilter, null);
                if (pick.Success)
                {
                    pick.Entity.SetColor(1, 0, 0);
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```