## Component

The Ultra Engine entity component system allows you to easily add behavior to game objects. This class can be extended to add behavior and properties to an [Entity](Entity.md).

| Property | Type | Description |
|---|---|---|
| [Collide](Component_Collide.md) | Method | called whenever a physics collision occurs |
| [Copy](Component_Copy.md) | Method | makes a copy of the component, for copying entities |
| [GetEntity](Component_GetEntity.md) | Method | retrieves the entity this component is attached to |
| [Load](Component_Load.md) | Method | called when an actor is loaded or copied |
| [Save](Component_Save.md) | Method | called when an actor is saved or copied |
| [Start](Component_Start.md) | Method | called when a component is added |
| [Update](Component_Update.md) | Method | called once each time [World::Update](World_Update.md) is called |

You can override these methods or add your own in your component class. To add a new component, just create a new .cs file in your "Source\Components" folder. You can use separate files if you want, but it is more convenient to put everything in a single file that is automatically included into your project. Compile your project once and the precompiler will detect your new file and update the component system code. The precompiler will automatically generate the files "ComponentSystem.cs". These files should never be changed by hand, since they will be overwritten every time the precompiler runs.

The precompiler is limited in its ability to parse C# declarations, so it's a good idea to stick to straightforward C# syntax.

## Using Components

To use components in C#, include the component's namespace and add the component to an entity with [Entity.AddComponent](Entity_AddComponent.md). The game engine will take care of the rest for you:

```csharp
using UltraEngine;

class Program {
    static void Main(string[] args){
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowType.WINDOW_CENTER | WindowType.WINDOW_TITLEBAR);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetFov(70);
        camera.SetPosition(0, 0, -3);

        //Create a light
        var light = BoxLight.Create(world);
        light.SetRotation(35, 45, 0);
        light.SetRange(-10, 10);

        //Create a box
        var box = Box.Create(world);
        box.SetColor(0,0,1);

        //Entity component system
        var component = box.AddComponent<Mover>();
        component.rotationspeed.y = 45;

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```

## Example Component

The Mover component is about as simple as it gets. It just stores some motion parameters and moves or turns the entity each time Update is called:
```csharp
using UltraEngine;

class Mover : Component
{
    Vec3 movementspeed;
    Vec3 rotationspeed = new Vec3(0, 10, 0);
    bool globalcoords = false;
    
    //Update method, called once per loop
    public void Update()
    {
        if (globalcoords)
        {
            this.Entity.Translate(movementspeed / 60.0f, true);
        }
        else
        {
            this.Entity.Move(movementspeed / 60.0f);
        }
        this.Entity.Turn(rotationspeed / 60.0f, globalcoords);
    }

    //This method will work with simple components
    public Component Copy()
    {
        return new Mover()
        {
            movementspeed = this.movementspeed,
            rotationspeed = this.rotationspeed,
            globalcoords = this.globalcoords
        };
    }
}
```

## Component Methods and Members

To call a component method or get a value, first check if a component of the desired type is attached to the entity, and then call the method:
```csharp
var component = entity.GetComponent<HealthManager>();
if (component != null) component.TakeDamage(10);
```