# CreateWorld

This function creates a new world object.

## Syntax

- [World](World.md) **CreateWorld**()

## Returns

Returns a new world object.

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
camera:SetPosition(0,0,-2)

--Create a model
local box = CreateBox(world)

--Create a light
local light = CreateBoxLight(world)
light:SetRotation(45,35,0)
light:SetColor(2)

--Main loop
while window:KeyDown(KEY_ESCAPE) == false and window:Closed() == false do

	--Rotate the model
	box:Turn(0,0.1,0)

	--Update the world
	world:Update()

	--Render the world to the framebuffer
	world:Render(framebuffer)

end
```
