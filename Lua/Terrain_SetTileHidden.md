# Terrain.SetTileHidden

This method is used to show or hide a single terrain tile.

## Syntax

- **SetTileHidden**(number x, number y, boolean hidden)
- **SetTileHidden**([iVec2](iVec2.md) coord, boolean hidden)

| Parameter | Description |
| --- | --- |
| coord, (x, y) | tile coordinate |
| hidden | if set to true the tile will be hidden, otherwise it will be visible |

## Example

This example lets you cut holes in the terrain.

![Terrain SetTileHidden](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/terrain_settilehidden.jpg)

```lua
local remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets"

--Get the display list
local displays = ultraengine.GetDisplays()

--Create a window
local window = ultraengine.CreateWindow("Terrain Cut", 0, 0, 1280, 720, displays[1], ultraengine.WINDOW_CENTER + ultraengine.WINDOW_TITLEBAR)

--Create a world
local world = ultraengine.CreateWorld()

--Create a framebuffer
local framebuffer = ultraengine.CreateFramebuffer(window)

--Create a camera
local camera = ultraengine.CreateCamera(world)
camera:SetFov(70)
camera:SetPosition(0, 100, -100)
camera:SetRotation(45, 0, 0)
camera:SetClearColor(0.125)

--Sunlight
local light = ultraengine.CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)
light:SetColor(2)

--Create terrain
local terrain = ultraengine.CreateTerrain(world, 512)
terrain:LoadHeightmap(remotepath .. "/Terrain/512.r16")
terrain:SetScale(1, 100, 1)

--Create base material
local ground = ultraengine.CreateMaterial()
local diffusemap = ultraengine.LoadTexture(remotepath .. "/Materials/Ground/river_small_rocks_diff_4k.dds")
local normalmap = ultraengine.LoadTexture(remotepath .. "/Materials/Ground/river_small_rocks_nor_gl_4k.dds")
ground:SetTexture(diffusemap, ultraengine.TEXTURE_DIFFUSE)
ground:SetTexture(normalmap, ultraengine.TEXTURE_NORMAL)
terrain:SetMaterial(ground)

--Camera controls
camera:AddComponent(ultraengine.CameraControls)

--Main loop
while not window:Closed() and not window:KeyDown(ultraengine.KEY_ESCAPE) do
    if window:MouseDown(ultraengine.MOUSE_LEFT) then
        local mousepos = window:GetMousePosition()
        local pickinfo = camera:Pick(framebuffer, mousepos.x, mousepos.y)
        if pickinfo.success then
            if pickinfo.entity == terrain then
                local pos = ultraengine.iVec2()
                pos.x = ultraengine.Round(pickinfo.position.x) + terrain.resolution.x / 2
                pos.y = ultraengine.Round(pickinfo.position.z) + terrain.resolution.y / 2
                local radius = 10
                for x = pos.x - radius, pos.x + radius do
                    for y = pos.y - radius, pos.y + radius do
                        terrain:SetTileHidden(x, y, not window:KeyDown(ultraengine.KEY_CONTROL))
                    end
                end
            end
        end
    end
    world:Update()
    world:Render(framebuffer)
end
```
