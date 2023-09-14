# Camera.SetTessellation

This method sets the desired polygon edge size for tessellated materials.

## Syntax

- **SetTessellation**(number polygonsize)

| Parameter | Description |
| --- | --- |
| polygonsize | desired size in pixels of tessellated polygons |

## Example

```lua
--Get the primary display
local displaylist = GetDisplays()
local display = displaylist[1];
if display == nil then RuntimeError("Primary display not found.") end
local displayscale = display:GetScale()

--Create a window
local window = CreateWindow("Tessellation", 0, 0, 1280, 720, display, WINDOW_CENTER + WINDOW_TITLEBAR)

--Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window);

--Create a world
local world = CreateWorld()

local remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/"

local specmap = LoadTexture(remotepath .. "Materials/Environment/Storm/specular.dds")
world:SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR)
local diffusemap = LoadTexture(remotepath .. "Materials/Environment/Storm/diffuse.dds")
world:SetEnvironmentMap(diffusemap, ENVIRONMENTMAP_DIFFUSE)
world:SetAmbientLight(0)

--Create a camera
local camera = CreateCamera(world)
camera:Move(0,0,-0.75)
camera:SetClearColor(0.125)
camera:SetTessellation(8) --Tessellated primitives are n pixels wide (zero or less disables tessellation)

--Create a light
local light = CreateBoxLight(world)
light:SetRotation(35,-25,0)
light:SetColor(2,2,2)

--Display material
local model = CreateCubeSphere(world)
local mtl = LoadMaterial(remotepath .. "Materials/Ground/rocks_ground_02.json")
model:SetMaterial(mtl)

--Main loop
while window:Closed() == false do

    model:Turn(0,0.1,0,true)

    world:Update()
    world:Render(framebuffer)

end
```
