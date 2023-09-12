# CreateBox

This function creates a new box model with a physics collider.

## Syntax

function CreateBox(world: [shared_ptr](https://www.lua.org/manual/5.3/manual.html#5.2)World, size: number = 1): [shared_ptr](https://www.lua.org/manual/5.3/manual.html#5.2)[Model](Model.md)
function CreateBox(world: [shared_ptr](https://www.lua.org/manual/5.3/manual.html#5.2)World, width: number, height: number, depth: number, xsegs: number = 1, ysegs: number = 1, zsegs: number = 1, type: [MeshPrimitives](MeshPrimitives.md) = MESH_TRIANGLES): [shared_ptr](https://www.lua.org/manual/5.3/manual.html#5.2)[Model](Model.md)

| Parameter | Description |
|---|---|
| world | world to create the model in |
| size, (width, height, depth) | uniform size or dimensions of the box |
| xsegs, ysegs, zsegs | number of segments on each axis |
| type | can be MESH_TRIANGLES or MESH_QUADS |

## Remarks

For materials that use tessellation, set the *quad* parameter to true.

## Returns

Returns a new model.

## Example

```lua
--Get the displays
local displays = UltraEngine.GetDisplays()

--Create a window
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR)

--Create a world
local world = UltraEngine.CreateWorld()

--Create a framebuffer
local framebuffer = UltraEngine.CreateFramebuffer(window)

--Create a camera
local camera = UltraEngine.CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -4)

--Create a light
local light = UltraEngine.CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetRange(-10, 10)
light:SetColor(2)

--Create a model
local model = UltraEngine.CreateBox(world)
model:SetColor(0, 0, 1)

--Main loop
while (window:Closed() == false and window:KeyDown(UltraEngine.KEY_ESCAPE) == false) do
    model:Turn(0, 1, 0)
    world:Update()
    world:Render(framebuffer)
end
return 0
```
