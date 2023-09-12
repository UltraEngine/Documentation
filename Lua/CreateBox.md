# CreateBox

This function creates a new box model with a physics collider.

## Syntax

- CreateBox(world: [World](World.md), size: number = 1): [Model](Model.md)
- CreateBox(world: [World](World.md), width: number, height: number, depth: number, xsegs: number = 1, ysegs: number = 1, zsegs: number = 1, type: MeshPrimitives = MESH_TRIANGLES): [Model](Model.md)

**Parameters**

- *world* (type: [World](World.md)): world to create the model in
- *size* (optional, type: number): uniform size of the box (default: 1)
- *width* (type: number): width of the box
- *height* (type: number): height of the box
- *depth* (type: number): depth of the box
- *xsegs* (optional, type: number): number of segments on the x-axis (default: 1)
- *ysegs* (optional, type: number): number of segments on the y-axis (default: 1)
- *zsegs* (optional, type: number): number of segments on the z-axis (default: 1)
- *type* (optional, type: [MeshPrimitives](MeshPrimitives.md)): type of mesh (default: MESH_TRIANGLES)

## Remarks

For materials that use tessellation, set the *quad* parameter to true.

## Returns

Returns a new model.

## Example

```lua
-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -4)

-- Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetRange(-10, 10)
light:SetColor(2)

-- Create a model
local model = CreateBox(world)
model:SetColor(0, 0, 1)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    model:Turn(0, 1, 0)
    world:Update()
    world:Render(framebuffer)
end
```
