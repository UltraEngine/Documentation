# Material:SetMetalness

This method sets the metallic property of a material.

## Syntax

`Material:SetMetalness(metallic)`

### Parameters

- `metallic`: metalness value between 0 and 1

## Remarks

Metallic materials use reflections for their color. Therefore you should call [World:SetEnvironmentMap](World_SetEnvironmentMap.md) and assign specular and diffuse reflection maps when using metallic materials. If the reflection environment maps are not provided then metallic materials will appear very dark.

## Example

![Example](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/material_setroughness.jpg)

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