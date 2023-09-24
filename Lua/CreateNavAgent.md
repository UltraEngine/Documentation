# CreateNavAgent

This function creates a new navigation agent.

## Syntax

- **CreateNavAgent**(navmesh: NavMesh): NavAgent
- **CreateNavAgent**(navmesh: NavMesh, radius: number, height: number): NavAgent

| Parameter | Description |
|---|---|
| navmesh | navigation mesh to add the agent to |
| radius | (optional) navigation agent radius override |
| height | (optional) navigation agent height override |

## Returns

Returns a new NavAgent object.

## Remarks

You can specify a radius and height to override the navigation mesh settings, but your settings should be equal to or less than those the navigation mesh was created with, to prevent characters from intersecting walls.

If you want to create differently sized characters with accurate navigation, you can create multiple navigation meshes.

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
