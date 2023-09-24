# CreateNavMesh

This function creates a new navigation mesh for pathfinding.

## Syntax

- [NavMesh](NavMesh.md) **CreateNavMesh**([World](World.md) world, number height, number tilesx, number tilesz, number tileres = 32, number voxelsize = 0.25, number agentradius = 0.4, number agentheight = 1.8, number stepheight = 0.501, number maxslope = 45.01)

| Parameter | Description |
| --- | --- |
| world | world to create the navmesh in |
| width | width of the navmesh volume |
| height | width of the navmesh volume |
| depth | width of the navmesh volume |
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
local displays = GetDisplays();

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetFov(70)
camera:SetClearColor(0.125)
camera:SetPosition(Vec3(0, 3, -6))
camera:SetRotation(Vec3(35, 0, 0))

--Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3, 3, 3)

--Create scene
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(Vec3(0, -0.5, 0))
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
agent:SetPosition(-2,1,0)

--Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do

    navmesh:SetDebugging(window:KeyDown(KEY_D))

    if window:MouseHit(MOUSE_LEFT) then
        local mousepos = window:GetMousePosition()
        local rayinfo = camera:Pick(framebuffer, mousepos.x, mousepos.y)
        if rayinfo.success then
            agent:Navigate(rayinfo.position)
        end
    end
    if window:KeyHit(KEY_SPACE) then
        agent:Stop()
    end

    world:Update()
    world:Render(framebuffer)
end
```
