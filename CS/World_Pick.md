# World.Pick

This method performs a line segment intersection test on all the entities in the world.

## Syntax

- [PickInfo](PickInfo.md) **Pick**(Vector3 p0, Vector3 p1, float radius = 0.0f, bool closest = false, Func<[Entity](Entity.md), [Object](Object.md), bool> filter = null, [Object](Object.md) extra = null)

| Parameter | Description |
| --- | --- |
| p0 | line start position |
| p1 | line end position |
| radius | if greater than zero a swept sphere intersection test will be performed |
| closest | if set to true the closest intersected point will be found, otherwise the routine will return on the first hit |
| filter | optional callback to filter objects |
| extra | optional extra value to pass to filter |

## Returns

If the line segment intersects the entity, the resulting PickInfo's *success* member will be set to true, otherwise it will be false.

If a filter callback is provided it will be called for each entity that is evaluated. If the callback returns true the entity will be tested, otherwise it will be skipped.

## Example

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/World_Pick.gif)

```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

class Program
{
    static bool PickFilter(Entity entity, Object extra)
    {
        if (entity.GetCollider() == null) { return false; }
        return true;
    }

    static void Main(string[] args)
    {
        // Get the displays
        var displays = Display.GetDisplays();

        // Create window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlag.WINDOW_CENTER | WindowFlag.WINDOW_TITLEBAR);

        // Create world
        var world = World.Create();

        // Create framebuffer
        var framebuffer = Framebuffer.Create(window);

        // Set up camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125f);
        camera.SetFov(70);
        camera.SetPosition(0, 2, -3);
        camera.SetRotation(25, 0, 0);

        // Add a light
        var light = DirectionalLight.Create(world);
        light.SetRotation(35, 45, 0);
        light.SetColor(5);

        // Set up the scene
        var floor = Plane.Create(world, 100, 100);
        floor.Move(0, -1, 0);

        var b1 = Box.Create(world, 2.0f);
        b1.SetPosition(-3.0f, 0.0f, 0.0f);
        b1.SetColor(1, 0, 0);

        var b2 = Box.Create(world, 2.0f);
        b2.SetColor(0.0f, 0.0f, 1.0f);
        b2.SetPosition(3.0f, 0.0f, 2.0f);
        b2.SetRotation(0.0f, 45.0f, 0.0f);

        var pivot = Pivot.Create(world);

        var rod_scale = 5.0f;
        var rod = Cylinder.Create(world, 0.05f);
        rod.SetCollider(null);
        rod.SetParent(pivot);
        rod.SetRotation(90.0f, 0.0f, 0.0f);
        rod.SetPosition(0.0f, 0.0f, rod_scale / 2.0f);
        rod.SetScale(1.0f, rod_scale, 1.0f);

        var sphere = Sphere.Create(world, 0.25f);
        sphere.SetCollider(null);
        sphere.SetParent(pivot);
        sphere.SetColor(0, 1, 0);
        sphere.SetPosition(0.0f, 0.0f, rod_scale);

        var spin_speed = 0.5f;
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            pivot.Turn(0.0f, spin_speed, 0.0f);

            var target_pos = new Vector3(0.0f, 0.0f, rod_scale);
            target_pos = Transform.Point(target_pos, Matrix4.Identity, pivot.GetMatrix(true).Inverse());

            // Perform a ray cast
            var pick_info = world.Pick(pivot.GetPosition(true), target_pos, 0.25f, true, PickFilter);
            if (pick_info.success)
            {
                sphere.SetPosition(pick_info.position, true);
            }
            else
            {
                sphere.SetPosition(target_pos, true);
            }

            // Update the world
            world.Update();

            // Render the world
            world.Render(framebuffer);
        }
    }
}
```

