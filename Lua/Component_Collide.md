# Component::Collide

This method is called evefy time the entity collides with another object.

## Syntax

- void **Collide**([Entity](Entity.md) collidedentity, [Vec3](Vec3.md) position, [Vec3](Vec3.md) normal, number speed)

| Parameter | Description |
|---|---|
| collidedentity | entity that has been collided with |
| position | point the collision occured at |
| normal | direction of the collision |
| speed | speed of the collision |

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

--Create the ground
local ground = CreateBox(world, 10, 0.25, 10)
ground:SetPosition(0,-1,0)

--Create a model
local box = CreateBox(world)
box:SetColor(0,0,1)

--Add a component for automatic motion
local component = {}

function component:Collide(entity, position, normal, speed)
	Print("COLLISION")
	Print("Position: "..tostring(position.x)..", "..tostring(position.y)..", "..tostring(position.z))
	Print("normal: "..tostring(normal.x)..", "..tostring(normal.y)..", "..tostring(normal.z))
	Print("speed: "..tostring(speed))
	Print("")
end

box:AddComponent(component, "MyComponent")
box:SetMass(10)
box:SetPosition(0,2,0)
box:SetRotation(0,0,-35)

--Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetColor(2)
light:SetRange(-5, 5)

while window:KeyDown(KEY_ESCAPE) == false and window:Closed() == false do

	--Update the world
	world:Update()

	--Render the world to the framebuffer
	world:Render(framebuffer)

end
```
