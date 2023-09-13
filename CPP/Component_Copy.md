# Component::Copy

This method is called when an entity is copied. This is a protected method that should be implemented in classes derived from the Component class, but should not be called directly.

## Syntax

- shared_ptr<[Component](Component.md)> **Copy**()

## Returns

Returns a new component.

## Example

In the example below, the health attribute will be correctly copied whether or not the Copy function is specified.

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a model
local box1 = CreateBox(world)

local t = {}
t.path = "testcomponent.lua"
t.health = 100

function t:Copy()
    local t = {}
    t.health = self.health
    return t;
end

--Add a component
box1:AddComponent(t)
box1.testcomponent.health = 98

--Copy and add a component
box2 = box1:Instantiate(world)

--Display a component value
Print(box2.testcomponent.health)
```
