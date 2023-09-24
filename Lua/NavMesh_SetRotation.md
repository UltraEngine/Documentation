# NavMesh:SetRotation

This method can be used to rotate a navigation mesh. You can make characters that walk on the ceiling, or handle navigation in a space simulation that has no uniform "up" direction.

## Syntax

- **SetRotation**(number pitch, number yaw, number roll)
- **SetRotation**([xVec3](xVec3.md) rotation)
- **SetRotation**([xQuat](xQuat.md) rotation)

| Parameter | Description |
|---|---|
| rotation (pitch, yaw, roll) | navigation mesh rotation |

## Example

This example tilts the scene and the navigation mesh by 45 degrees. Note that the navigation agent is aligned to the navmesh rotation.

```lua
--Create a window
local displays = GetDisplays()
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
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
light:SetColor(3)

--Create scene
local ground = CreateBox(world, 10, 1, 10)
ground:SetRotation(0, 0, 45)
ground:Move(0, -0.5, 0)
ground:SetColor(0, 1, 0)
local wall = CreateBox(world, 1, 2, 4)
wall:SetRotation(0, 0, 45)

--Create navmesh
local navmesh = CreateNavMesh(world, 5, 4, 4)
navmesh:SetRotation(0,0,45)
navmesh:Build()

--Create player
local player = CreateCylinder(world, 0.4, 1.8)
player:SetNavObstacle(false)
player:SetColor(0, 0, 1)
local agent = CreateNavAgent(navmesh)
player:Attach(agent)
agent:SetPosition(navmesh:RandomPoint())

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    if window:MouseHit(MOUSE_LEFT) then
        local mousepos = window:GetMousePosition()
        local rayinfo = camera:Pick(framebuffer, mousepos.x, mousepos.y)
        if rayinfo.success then
            agent:Navigate(rayinfo.position)
        end
    end

    world:Update()
    world:Render(framebuffer)
end
```
