# Material:SetTessellation

This method controls whether a material will use hardware tessellation.

## Syntax

- **SetTessellation**(boolean mode)

| Parameter | Description |
|---|---|
| mode | set to true to enable tessellation |

## Remarks

Tessellation will only be used if the camera has it enabled with [Camera::SetTessellation](Camera_SetTessellation.md).

## Example

```lua
remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets"

-- Get the primary display
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()
world:SetAmbientLight(0)

-- Create a camera
local camera = CreateCamera(world)
camera:SetPosition(0, 0, -1)
camera:SetFov(70)
camera:SetClearColor(0.125)
camera:SetTessellation(4)

-- Create a light
local light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetRotation(35, 35, 0)
light:SetColor(4)

-- Display material
local model = CreateCubeSphere(world, 0.5, 8, MESH_QUADS)
local mtl = LoadMaterial(remotepath .. "/Materials/Ground/rocks_ground_02.json")
mtl:SetTessellation(true)
mtl:SetDisplacement(0.075)
model:SetMaterial(mtl)

-- Main loop
while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    -- Arrow keys move
    if window:KeyDown(KEY_DOWN) then
        camera:Move(0, 0, -0.01)
    end
    if window:KeyDown(KEY_UP) then
        camera:Move(0, 0, 0.01)
    end
    
    -- Show wireframe render when key is pressed
    camera:SetWireframe(window:KeyDown(KEY_W))
    
    -- Rotate the model
    model:Turn(0, 0.1, 0)
    
    world:Update()
    world:Render(framebuffer)
end
```
