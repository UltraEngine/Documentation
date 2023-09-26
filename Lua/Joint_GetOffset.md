# Joint:GetOffset

This method returns the current joint offset.

## Syntax

- number **GetOffset**()

## Returns

Returns the current angle of a hinge joint in degrees, or position of a slider joint in meters.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()

-- Create a camera    
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -6)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

local parent = CreateBox(world)
parent:SetColor(0, 0, 1)

local child = CreateBox(world)
child:SetPosition(4, 0, 0)
child:SetMass(1)
child:SetColor(0, 1, 0)

-- Create joint
local joint = CreateHingeJoint(parent.position, Vec3(0, 0, 1), parent, child)

-- Setup 2D display
local cam2d = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
cam2d:SetRenderLayers(128)
cam2d:SetClearMode(CLEAR_DEPTH)
cam2d:SetPosition(framebuffer.size.x * 0.5, framebuffer.size.y * 0.5)

local font = LoadFont("Fonts/arial.ttf")
local sprite = CreateSprite(world, font, "0", 18)
sprite:SetRenderLayers(128)
sprite:SetPosition(2, framebuffer.size.y - font:GetHeight(18) - 2, 0)

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    sprite:SetText("Angle: " .. tostring(joint:GetOffset()))
    world:Update()
    world:Render(framebuffer)
end

return 0
```
