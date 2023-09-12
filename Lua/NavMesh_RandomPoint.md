# NavMesh:RandomPoint

This method returns a random valid position on the navigation mesh. This can be useful for placing enemies or making characters wander throughout a scene.

---

## Syntax

- **RandomPoint**() -> Vec3

---
## Returns

- Returns a valid position on the navigation mesh.

---
## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

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

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    --Press the space key to reposition the agent
    if window:KeyHit(KEY_SPACE) then
        agent:SetPosition(navmesh:RandomPoint())
        player:Sync()
    end

    world:Update()
    world:Render(framebuffer)
end
```