# Component:Copy

This function is called when an entity is copied. This is a protected function that should be implemented in classes derived from the Component class, but should not be called directly.

## Syntax

- [Component](Component.md) **Copy**()

## Returns

Returns a new component.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -2)

--Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetColor(2)
light:SetRange(-5, 5)

--Create the ground
local ground = CreateBox(world, 10, 0.25, 10)
ground.name = "Ground"
ground:SetPosition(0,-1,0)

--Create some entities
local box1 = CreateBox(world)
local box2 = CreateBox(world)

local t = {}
t.path = "testcomponent"
t.health = 100

function t:Copy()
    t = {}
    local k, v
    for k, v in pairs(self) do
        t[k] = v
    end
    return t;
end

--Add a component
box1:AddComponent(t)

--Copy and add a component
box2:AddComponent(box1.testcomponent:Copy())

--Display a component value
Print(box2.testcomponent.health)
```
