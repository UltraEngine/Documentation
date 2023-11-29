```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowStyle.Titlebar | WindowStyle.Center);

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
        var light = new BoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(30, 30);
        light.SetRotation(45, 35, 0);
        light.SetColor(2f);

        //Create ground
        var ground = new Box(world, 20, 1, 20);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);

        //Create model
        var model = new Sphere(world, 1);
        model.SetMass(1);
        model.SetColor(0, 0, 1);
        model.AddForce(10, 0, -10);

        //Add some parts
        var part = new Cone(world);
        part.SetColor(1, 0, 0);
        part.SetPosition(1, 0, 0);
        part.SetRotation(0, 0, -90);
        part.SetParent(model);

        part = new Cone(world);
        part.SetColor(1, 0, 0);
        part.SetPosition(-1, 0, 0);
        part.SetRotation(0, 0, 90);
        part.SetParent(model);

        part = new Cone(world);
        part.SetColor(1, 0, 0);
        part.SetPosition(0, 0, 1);
        part.SetRotation(90, 0, 0);
        part.SetParent(model);

        part = new Cone(world);
        part.SetColor(1, 0, 0);
        part.SetPosition(0, 0, -1);
        part.SetRotation(-90, 0, 0);
        part.SetParent(model);

        part = new Cone(world);
        part.SetColor(1, 0, 0);
        part.SetPosition(0, -1, 0);
        part.SetRotation(180, 0, 0);
        part.SetParent(model);

        part = new Cone(world);
        part.SetColor(1, 0, 0);
        part.SetPosition(0, 1, 0);
        part.SetParent(model);

        model.SetPosition(0, 5, 0);

        //Remove colliders from child primitives
        foreach (var child in model.kids)
        {
            child.SetCollider(null);
        }

        //Create collision
        List<Collider> collisions = new List<Collider>();
        collisions.Add(new SphereCollider(1));
        collisions.Add(new ConeCollider(0.5f, 1, 1, 0, 0, 0, 0, -90));
        collisions.Add(new ConeCollider(0.5f, 1, -1, 0, 0, 0, 0, 90));
        collisions.Add(new ConeCollider(0.5f, 1, 0, 1, 0, 0, 0, 0));
        collisions.Add(new ConeCollider(0.5f, 1, 0, -1, 0, 180, 0, 0));
        collisions.Add(new ConeCollider(0.5f, 1, 0, 0, 1, 90, 0, 0));
        collisions.Add(new ConeCollider(0.5f, 1, 0, 0, -1, -90, 0, 0));
        var collider = CreateCompoundCollider(collisions);
        model.SetCollider(collider);

        while (!window.Closed() && !window.KeyHit(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```