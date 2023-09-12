# Camera:SetRealtime

This method allows you to control whether a camera renders continuously or only when prompted to.

## Syntax

```lua
Camera:SetRealtime(mode: boolean)
```

## Parameters

| Parameter | Description |
|---|---|
| mode | If set to true, the camera will render continuously, otherwise it will render only when [Camera:Render](Camera_Render.md) is called |

## Remarks

You may want some cameras to only render once in a while, or when something changes. For example, a security camera that shows an image on a monitor in-game only needs to be refreshed when the monitor is visible.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a world
local world = CreateWorld()

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create light
local light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetRotation(15, 15, 0)
light:SetColor(2)

--Create camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -3)
camera:SetFOV(70)

--Create scenery
local box = CreateBox(world)

local cone = CreateCone(world)
cone:SetPosition(1.25, 0, 0)
cone:SetColor(0, 0, 1)

local sphere = CreateSphere(world)
sphere:SetPosition(-1.25, 0, 0)
sphere:SetColor(1, 0, 0)

--Create camera and texture buffer
local texbuffer = CreateTextureBuffer(256, 256)
local cam2 = CreateCamera(world)
cam2:SetClearColor(1, 1, 1)
cam2:SetRenderTarget(texbuffer)
cam2:SetRealtime(false)

--Create material
local mtl = CreateMaterial()
local tex = texbuffer:GetColorAttachment()
mtl:SetTexture(tex)
box:SetMaterial(mtl)
cone:SetMaterial(mtl)
sphere:SetMaterial(mtl)

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    --Orient the texturebuffer camera
    cam2:SetPosition(0, 0, 0)
    cam2:Turn(0, 1, 0)
    cam2:Move(0, 0, -3)

    --Press the space key to redraw the texture buffer camera
    if window:KeyHit(KEY_SPACE) then
        cam2:Render()
    end

    world:Update()
    world:Render(framebuffer)
end
```