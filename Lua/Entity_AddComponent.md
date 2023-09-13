# Entity:AddComponent

This method adds a component to the entity.

## Syntax

- [Component](Component.md) **AddComponent**([string](https://www.lua.org/manual/5.4/manual.html#6.4) name)

| Parameter | Description |
|---|---|
| name | name of a Lua component |
  
## Returns

Returns a new component if successful, otherwise NULL is returned.

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

--Create a model
local box = CreateBox(world)
box:SetColor(0,0,1)

--Add a component for automatic motion
local component = box:AddComponent("Source/Components/Motion/Mover.lua")
component.rotationspeed.y = -2
box.mover.rotationspeed.x = 2

while window:KeyDown(KEY_ESCAPE) == false and window:Closed() == false do

    --Update the world
    world:Update()

    --Render the world to the framebuffer
    world:Render(framebuffer)

end
```
