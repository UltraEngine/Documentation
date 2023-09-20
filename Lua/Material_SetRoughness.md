# Material:SetRoughness

This method sets the roughness of a material. A material with low roughness will appear more reflective than a rough surface.

## Syntax

- **SetRoughness**(number roughness)

| Parameter | Description |
|---|---|
| roughness | surface roughness between 0 and 1 |

## Example

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/material_setroughness.jpg)

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a world
local world = CreateWorld()

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -10)
camera:SetFOV(50)

local specmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/specular.dds")
local diffmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/diffuse.dds")

world:SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR)
world:SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE)

local models = {}

for x = 0, 3 do
    for y = 0, 3 do
        local mtl = CreateMaterial()
        mtl:SetRoughness(x / 3.0)
        mtl:SetMetalness(y / 3.0)

        local ball = CreateSphere(world)
        ball:SetPosition(x * 2.0 - 3.0, y * 2.0 - 3.0, 0)
        ball:SetMaterial(mtl)
        table.insert(models, ball)
    end
end

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```

Note: The shared_ptr type used in the C++ code is not available in Lua.
