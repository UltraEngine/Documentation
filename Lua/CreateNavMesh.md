# CreateNavMesh

This function creates a new navigation mesh for pathfinding.

## Syntax

- [NavMesh](NavMesh.md) **CreateNavMesh**([World](World.md) world, number height, number tilesx, number tilesz, number tileres = 32, number voxelsize = 0.25, number agentradius = 0.4, number agentheight = 1.8, number stepheight = 0.501, number maxslope = 45.01)

| Parameter | Description |
| --- | --- |
| world | world to create the navmesh in |
| height | width of the navmesh volume |
| tilesx | number of tiles along the X axis |
| tilesz | number of tiles along the Z axis |
| tileres | number of voxels per tile |
| voxelsize | resolution of voxel grid |
| agentradius | radius of the characters that will use this navmesh |
| agentheight | height of the characters that will use this navmesh |
| stepheight | maximum height that can be stepped up |
| maxslope | maximum slope that can be traversed, in degrees |

## Returns

Returns a new Navmesh object.

## Example

```lua
-- Create a window
local displays = GetDisplays()
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetFov(70)
camera:SetClearColor(0.125)
camera:SetPosition(0, 3, -6)
camera:SetRotation(35, 0, 0)

--Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(2)

--Create scene
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)
local wall = CreateBox(world, 1, 2, 4)

--Create navmesh
local navmesh = CreateNavMesh(world, 5, 4, 4)
navmesh:Build()

--Create player
local player = CreateCylinder(world, 0.4, 1.8)
player:SetNavObstacle(false)
player:SetColor(0, 0, 1)
local agent = CreateNavAgent(navmesh)
player:Attach(agent)
agent:SetPosition(navmesh:RandomPoint())

local nodes = {}

--Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    if window:MouseHit(MOUSE_LEFT) then
        local mousepos = window:GetMousePosition()
        local rayinfo = camera:Pick(framebuffer, mousepos.x, mousepos.y)
        if rayinfo.success then
            local path = navmesh:PlotPath(player.position, rayinfo.position)
            nodes = {}
            collectgarbage()
            for n = 1, #path do
                if nodes[n] == nil then
                    nodes[n] = CreateSphere(world, 0.25)
                    nodes[n]:SetNavObstacle(false)
                    nodes[n]:SetColor(1, 0, 0)
                end
                nodes[n]:SetPosition(path[n])                
            end
        end
    end

    world:Update()
    world:Render(framebuffer)
end
```
