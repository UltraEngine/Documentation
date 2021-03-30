# CreateCollisionBox #
This function creates a collision box shape for physics interactions.

## Syntax ##
- [Collision](Collision.md) **CreateCollisionBox**(number w, number h, number d)
- [Collision](Collision.md) **CreateCollisionBox**(number w, number h, number d, number x, number y, number z)
- [Collision](Collision.md) **CreateCollisionBox**(number w, number h, number d, number x, number y, number z, number rx, number ry, number rz)
- [Collision](Collision.md) **CreateCollisionBox**([Vec3](Vec3.md) size, [Vec3](Vec3.md) offset = 0, [Vec3](Vec3.md) rotation = 0)

## Parameters ##
|Name|Description|
|---|----|
|**w**|width of collision box|
|**h**|height of collision box|
|**d**|depth of collision box|
|**x**|x component of collision box offset|
|**y**|y component of collision box offset|
|**z**|z component of collision box offset|
|**rx**|pitch of collision box rotation|
|**ry**|yaw of collision box rotation|
|**rz**|roll of collision box rotation|
|**size**|size of collision box|
|**offset**|offset of collision box|
|**rotation**|rotation of collision box|

## Returns ##
Returns a new collision object.

## Example ##
```Lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow(displays[1], "", 0, 0, 1280, 720, WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:Move(0, 1, -3)
camera:SetFOV(70)

--Create light
local light = CreateLight(world, LIGHT_DIRECTIONAL)
light:SetRotation(45, 35, 0)

--Create ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)

--Load model
local model = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Containers/crate01.glb")
model:SetPosition(0, 3, 0)
model:SetRotation(0, 0, 15)
model:SetMass(1)

--Create collision
local bounds = model:GetBounds(BOUNDS_LOCAL)
local collision = CreateCollisionBox(bounds.size, bounds.center)
model:SetCollision(collision)

while window:Closed() == false do
    world:Update()
    world:Render(framebuffer)
end
```