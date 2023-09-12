# NavMesh:PlotPath

This method is used to plot a path between two points.

## Syntax

`NavMesh:PlotPath(origin, destination)`

- `origin` (Vec3): path starting point
- `destination` (Vec3): path end point

## Returns

Returns a table containing the plotted path points. If a path could not be plotted between the origin and destination, then the returned table will be empty.

## Example

```lua
--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetFOV(70)
camera:SetClearColor(0.125)
camera:SetPosition(0, 3, -6)
camera:SetRotation(35, 0, 0)

--Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

--Create scene
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)
local wall = CreateBox(world, 1, 2, 4)

--Create navmesh
local navmesh = CreateNavMesh(world, 10, 5, 10, 4, 4)
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
            for n = 1, #path do
                if nodes[n] == nil then
                    nodes[n] = CreateSphere(world, 0.25)
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