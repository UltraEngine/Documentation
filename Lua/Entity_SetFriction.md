# Entity:SetFriction

This method sets the friction of the entity.

## Syntax

- **Entity:SetFriction**(kinematicfriction, staticfriction = 0)

| Parameter | Description |
|---|---|
| kinematicfriction | friction of an object in motion |
| staticfriction | initial friction a stationary object must overcome to begin sliding |

## Remarks

The Box2D physics engine only uses kinematic friction.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

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
light:SetArea(15, 15)
light:SetRotation(45, 35, 0)
light:SetColor(2)

--Create the ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)
    
--Add some boxes
local box1 = CreateBox(world, 1, 1, 1)
box1:SetPosition(-1, 0.5, 0)
box1:SetColor(0, 0, 1)
box1:SetMass(1)
box1:SetFriction(0, 0)

local box2 = CreateBox(world, 1, 1, 1)
box2:SetPosition(1, 0.5, 0)
box2:SetColor(0, 0, 1)
box2:SetMass(1)
box2:SetFriction(1, 1)

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    --Press the space key to push the boxes
    if window:KeyHit(KEY_SPACE) then
        box1:AddForce(0, 0, 100)
        box2:AddForce(0, 0, 100)
    end

    world:Update()
    world:Render(framebuffer)
end