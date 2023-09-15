# Entity:SetCollisionType

This method sets the entity collision type, for filtering collisions for physics.

## Syntax

- **SetCollisionType**(number collisiontype, boolean recursive = false)

| Parameter | Description |
|---|---|
| collisiontype | entity collision type to set |
| recursive | if set to true all children in the sub-hierarchy will also be set |

## Remarks

The collision type can be any integer value or predefined collision type:
- COLLISIONTYPE_NONE
- COLLISIONTYPE_PROP
- COLLISIONTYPE_SCENE
- COLLISIONTYPE_PLAYER
- COLLISIONTYPE_TRIGGER
- COLLISIONTYPE_DEBRIS
- COLLISIONTYPE_PROJECTILE

Collision responses can be controlled with the [World:SetCollisionResponse](World_SetCollisionResponse.md) command.

The table below shows the default collision responses the engine defines for each new world:

| Type 1 | Type 2 | Response |
|---|---|---|
| COLLISIONTYPE_PROP | COLLISIONTYPE_PROP | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_SCENE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_SCENE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_PROP | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_SCENE | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PLAYER | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_SCENE | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PLAYER | COLLISIONTYPE_TRIGGER | COLLISIONRESPONSE_DETECT |

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR)

--Create a world
local world = CreateWorld()

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a camera    
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 1, -4)

--Create light
local light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetRotation(45, 35, 0)
light:SetColor(2)

--Create the ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

--Add some boxes
local box1 = CreateBox(world)
box1:SetMass(1)
box1:SetPosition(-1, 5, 0)
box1:SetCollisionType(COLLISION_PROP)
box1:SetColor(0, 0, 1)

local box2 = CreateBox(world)
box2:SetMass(1)
box2:SetPosition(1, 5, 0)
box2:SetCollisionType(COLLISION_NONE)
box2:SetColor(0, 0, 1)

--Very slow gravity
world:SetGravity(0, -1, 0)

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
