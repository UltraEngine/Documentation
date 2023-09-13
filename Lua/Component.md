# Component

The Ultra Engine entity component system allows you to easily add behavior to game objects. This class can be extended to add behavior and properties to an [Entity](Entity.md).

| Property    | Type                  | Description                                                |
| ----------- | --------------------- | ---------------------------------------------------------- |
| entity      | [Entity](Entity.md) | entity this component is attached to |
| [Collide](Component_Collide.md)  | Method                | called whenever a physics collision occurs                 |
| [Copy](Component_Copy.md)     | Method                | makes a copy of the component, for copying entities        |
| [Load](Component_Load.md)     | Method                | called when an actor is loaded or copied                   |
| [Save](Component_Save.md)     | Method                | called when an actor is saved or copied                    |
| [Start](Component_Start.md)   | Method                | called when a component is added                           |
| [Update](Component_Update.md) | Method                | called once each time [World:Update](World_Update.md) is called |

You can override these methods or add your own in your component class. To add a new component, just create a new .lua file in your "Source\Components" folder. You can use separate files if you want, but it is more convenient to put everything in a single file that can be included into your project. Compile your project once and the Lua interpreter will detect your new file and update the component system code. The component system will automatically update the component registration when the Lua interpreter detects changes to the component files.

The Lua interpreter is limited in its ability to parse Lua declarations, so it's a good idea to stick to straightforward Lua syntax.

## Using Components

To use components in Lua, create a new Lua script and use the Lua API functions to add the component to an entity with [Entity:AddComponent](Entity_AddComponent.md). The game engine will take care of the rest for you:

```lua
-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetFov(70)
camera:SetPosition(0, 0, -3)

-- Create a light
local light = CreateBoxLight(world)
light:SetRotation(35, 45, 0)
light:SetRange(-10, 10)

-- Create a box
local box = CreateBox(world)
box:SetColor(0, 0, 1)

-- Entity component system
local mover = box:AddComponent(Mover)
mover.rotationspeed.y = 45

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```

## Example Component

The Mover component is about as simple as it gets. It just stores some motion parameters and moves or turns the entity each time Update is called:

```lua
Mover = {}

function Mover:Update()
    if self.globalcoords then
        self.entity:Translate(self.movementspeed / 60.0, true)
    else
        self.entity:Move(self.movementspeed / 60.0)
    end
    self.entity:Turn(self.rotationspeed / 60.0, self.globalcoords)
end

function Mover:Copy()
    local copy = {}
    for k, v in pairs(self) do
        copy[k] = v
    end
    return copy
end

function Mover.new()
    local instance = {
        movementspeed = Vec3(),
        rotationspeed = Vec3(0, 10, 0),
        globalcoords = false
    }
    setmetatable(instance, { __index = Mover })
    return instance
end
```

## Component Methods and Members

To call a component method or get a value, first check if a component of the desired type is attached to the entity, and then call the method:

```lua
local component = entity:GetComponent(HealthManager)
if component then
    component:TakeDamage(10)
end
```
