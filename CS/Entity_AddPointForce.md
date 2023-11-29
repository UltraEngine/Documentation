# Entity.AddPointForce

This method applies a force, measured in Newtons, to an entity at a specified point. This can result in both movement and rotation of the entity.

## Syntax

- void **AddPointForce**(float fx, float fy, float fz, float x, float y, float z, bool global = true)
- void **AddPointForce**(Vector3 force, Vector3 position, bool global = true)

| Parameter | Description |
| --- | --- |
| force, (fx, fy, fz) | force to add |
| position, (x, y, z) | point where the force is applied |

## Example

```csharp
using Ultrasound;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowOptions.Center | WindowOptions.TitleBar);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera
        var camera = CreateCamera(world);
        camera.SetPosition(0, 0, -2);
        camera.SetClearColor(0.125);

        //Create light
        var light = CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create model
        var box = CreateBox(world);
        box.SetMass(1);
        box.SetColor(0, 0, 1);
        box.SetGravityMode(false);
        box.SetDamping(0.9, 0.9);

        while (!window.Closed() && !window.KeyDown(Key.Escape))
        {
            //Click the mouse to apply a force
            if (window.MouseHit(MouseButton.Left))
            {
                var mousepos = window.GetMousePosition();
                var pick = camera.Pick(framebuffer, mousepos.x, mousepos.y);
                if (pick.success)
                {
                    box.AddPointForce(new Vector3(0, 0, 1), pick.position);
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```