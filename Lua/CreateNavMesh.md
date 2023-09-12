# CreateNavMesh

This function creates a new navigation mesh for pathfinding.

## Syntax

```lua
CreateNavMesh(world: World, width: number, height: number, depth: number, tilesx: number, tilesz: number, voxelsize: number = 0.25, agentradius: number = 0.4, agentheight: number = 1.8, agentstepheight: number = 0.501, maxslope: number = 45.01) -> NavMesh
```

### Parameters

| Parameter | Description |
| --- | --- |
| world | world to create the navmesh in |
| width | width of the navmesh volume |
| height | width of the navmesh volume |
| depth | width of the navmesh volume |
| tilesx | number of tiles along the X axis |
| tilesz | number of tiles along the Z axis |
| voxelsize | resolution of voxel grid |
| agentradius | radius of the characters that will use this navmesh |
| agentheight | height of the characters that will use this navmesh |
| agentstepheight | maximum height that can be stepped up |
| maxslope | maximum slope that can be traversed, in degrees |

### Returns

Returns a new NavMesh object.

## Example

```lua
-- Create a window
local displays = GetDisplays()
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world)
camera:SetFOV(70)
camera:SetClearColor(0.125)
camera:SetPosition(0, 3, -6)
camera:SetRotation(35,0,0)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

-- Create scene
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)
local wall = CreateBox(world, 1, 2, 4)

-- Create navmesh
local navmesh = CreateNavMesh(world, 10, 5, 10, 4, 4)
navmesh:Build()

-- Create player
local player = CreateCylinder(world, 0.4, 1.8)
player:SetNavObstacle(false)
player:SetColor(0, 0, 1)
local agent = CreateNavAgent(navmesh)
player:Attach(agent)

-- Main loop
while (not window:Closed() and not window:KeyDown(KEY_ESCAPE)) do
    if (window:MouseHit(MOUSE_LEFT)) then
        local mousepos = window:GetMousePosition()
        local rayinfo = camera:Pick(framebuffer, mousepos.x, mousepos.y)
        if (rayinfo.success) then
            agent:Navigate(rayinfo.position)
        end
    end
    
    world:Update()
    world:Render(framebuffer)
end
```