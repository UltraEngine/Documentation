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
