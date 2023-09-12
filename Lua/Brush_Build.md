# Brush:Build

This method calculates face planes, checks for flipped faces, updates texture mapping, updates the brush bounding boxes, builds a physics collider, and builds visible meshes.

## Syntax

- `void` **Build**()

## Example

This example creates a box brush from scratch.

```lua
--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:Turn(35, 0, 0)
camera:Move(0, 0, -4)

--Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)

--Create brush
local brush = CreateBrush(world)
brush:SetColor(0, 0, 1)

--Add brush vertices
local w = 1
local h = 1
local d = 1
brush:AddVertex(w * 0.5, h * 0.5, d * 0.5)
brush:AddVertex(-w * 0.5, h * 0.5, d * 0.5)
brush:AddVertex(-w * 0.5, h * 0.5, -d * 0.5)
brush:AddVertex(w * 0.5, h * 0.5, -d * 0.5)
brush:AddVertex(w * 0.5, -h * 0.5, d * 0.5)
brush:AddVertex(-w * 0.5, -h * 0.5, d * 0.5)
brush:AddVertex(-w * 0.5, -h * 0.5, -d * 0.5)
brush:AddVertex(w * 0.5, -h * 0.5, -d * 0.5)

--Add faces
local face = brush:AddFace()
face:AddIndice(0)
face:AddIndice(1)
face:AddIndice(2)
face:AddIndice(3)

face = brush:AddFace()
face:AddIndice(4)
face:AddIndice(5)
face:AddIndice(6)
face:AddIndice(7)

face = brush:AddFace()
face:AddIndice(0)
face:AddIndice(1)
face:AddIndice(5)
face:AddIndice(4)

face = brush:AddFace()
face:AddIndice(2)
face:AddIndice(3)
face:AddIndice(7)
face:AddIndice(6)

face = brush:AddFace()
face:AddIndice(1)
face:AddIndice(2)
face:AddIndice(6)
face:AddIndice(5)

face = brush:AddFace()
face:AddIndice(0)
face:AddIndice(3)
face:AddIndice(7)
face:AddIndice(4)

--Finalize the brush
brush:Build()

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end

return 0
```