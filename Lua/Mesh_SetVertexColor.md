# Mesh:SetVertexColor

This method can be used to modify the color of a single vertex.

## Syntax

- **SetVertexColor**(number index, number r, number g, number b, number a = 1)
- **SetVertexColor**(number index, [Vec4](Vec4.md) color)

| Parameter | Description |
|---|---|
| index | vertex indice |
| color (r,g,b,a) | color to set |

## Remarks

Vertex colors are not compatible with skinned meshes.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -1)

-- Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetRange(-10, 10)
light:SetColor(2)

-- Create a model
local model = CreateSphere(world)
for v = 0, model.lods[1].meshes[1]:GetVertexCount() - 1 do
    model.lods[1].meshes[1]:SetVertexColor(v, Random(), Random(), Random())
end

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    model:Turn(0, 1, 0)
    world:Update()
    world:Render(framebuffer)
end
```
