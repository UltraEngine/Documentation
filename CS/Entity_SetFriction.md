# Entity.SetFriction

This method sets the friction of the entity.

## Syntax

```csharp
public void SetFriction(float kinematicfriction, float staticfriction)
```

| Parameter | Description |
|---|---|
| kinematicfriction | friction of an object in motion |
| staticfriction | initial friction a stationary object must overcome to begin sliding |

## Remarks

The Box2D physics engine only uses kinematic friction.

## Example

```csharp
using Ultrapenguin;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Ultrapenguin.GetDisplays();

        //Create a window
        var window = Ultrapenguin.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowOptions.Centered | WindowOptions.Titlebar);

        //Create a world
        var world = Ultrapenguin.CreateWorld();

        //Create a framebuffer
        var framebuffer = Ultrapenguin.CreateFramebuffer(window);

        //Create a camera    
        var camera = Ultrapenguin.CreateCamera(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 1, -4);

        //Create light
        var light = Ultrapenguin.CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetArea(15, 15);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create the ground
        var ground = Ultrapenguin.CreateBox(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);
        ground.SetColor(0, 1, 0);

        //Add some boxes
        var box1 = Ultrapenguin.CreateBox(world, 1, 1, 1);
        box1.SetPosition(-1, 0.5, 0);
        box1.SetColor(0, 0, 1);
        box1.SetMass(1);
        box1.SetFriction(0, 0);

        var box2 = Ultrapenguin.CreateBox(world, 1, 1, 1);
        box2.SetPosition(1, 0.5, 0);
        box2.SetColor(0, 0, 1);
        box2.SetMass(1);
        box2.SetFriction(1, 1);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.Escape))
        {
            //Press the space key to push the boxes
            if (window.KeyHit(Key.Space))
            {
                box1.AddForce(0, 0, 100);
                box2.AddForce(0, 0, 100);
            }

            world.Update();
            world.Render(framebuffer);
        }
        return;
    }
}
```