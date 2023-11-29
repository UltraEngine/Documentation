# CreateCylinderCollider

This function creates a collision cylinder shape for physics interactions.

## Syntax

- `Collider` **CreateCylinderCollider**(float radius, float height, float x = 0, float y = 0, float z = 0, float pitch = 0, float yaw = 0, float roll = 0)

- `Collider` **CreateCylinderCollider**(float radius, float height, `Vec3` offset, `Vec3` rotation = 0)

|Parameter|Description|
|---|----|
|radius|radius of shape|
|height|height of shape|
|x|x component of shape offset|
|y|y component of shape offset|
|z|z component of shape offset|
|pitch|pitch of shape rotation|
|yaw|yaw of shape rotation|
|roll|roll of shape rotation|
|offset|offset of shape|
|rotation|rotation of shape|

## Returns

Returns a new collider object.

## Example

```csharp
using UltraEngine;

public class Program
{
    public static void Main()
    {
        //Get the display list
        var displays = Display.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], Window.WINDOW_TITLEBAR | Window.WINDOW_CENTER);

        //Create framebuffer
        var framebuffer = new Framebuffer(window);

        //Create world
        var world = new World();

        //Create camera
        var camera = new Camera(world);
        camera.SetFOV(70);
        camera.Turn(15, 0, 0);
        camera.Move(0, 2, -8);
        camera.SetClearColor(0.125f);

        //Create light
        var light = new DirectionalLight(world);
        light.SetRotation(45, 35, 0);

        //Create ground
        var ground = new Box(world, 10, 1, 10);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);

        //Create model
        var model = new Cylinder(world, 0.5f, 4);
        model.SetPosition(0, 5, 0);
        model.Turn(90, 10, 0);
        model.SetColor(0, 0, 1);
        model.SetMass(1);
        model.AddForce(100, 0, 0);

        //Create collider
        var collider = CreateCylinderCollider(0.5f, 4);
        model.SetCollider(collider);

        while (!window.Closed() && !window.KeyHit(Window.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```