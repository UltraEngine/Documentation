### NavMesh:Build

This method will build the navigation mesh.

#### Syntax

- **Build**(maxedgelength: number)

| Parameter | Description |
|---|---|
| maxedgelength | maximum edge length, in meters |

#### Remarks

You do not need to call this method, as the navigation mesh will be updated in the background whenever the scene changes. However, you may wish to manually build navigation meshes when your game starts in order to ensure that navigation data is available immediately.

#### Example

```lua
require("UltraEngine")

--Create a window
local window = Window("Ultra Engine", 0, 0, 1280, 720, Display:Main(), WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = Framebuffer(window)

--Create a world
local world = World()

--Create a camera
local camera = Camera(world)
camera:SetFOV(70)
camera:SetClearColor(0.125)
camera:SetPosition(Vec3(0, 3, -6))
camera:SetRotation(Vec3(35, 0, 0))

--Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(Vec3(35, 35, 0))
light:SetColor(Vec3(3, 3, 3))

--Create scene
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(Vec3(0, -0.5, 0))
ground:SetColor(Vec3(0, 1, 0))
local wall = CreateBox(world, 1, 2, 4)

--Create navmesh
local navmesh = CreateNavMesh(world, 10, 5, 10, 4, 4)
navmesh:Build()

--Create player
local player = CreateCylinder(world, 0.4, 1.8)
player:SetColor(Vec3(0, 0, 1))
local agent = CreateNavAgent(navmesh)
player:Attach(agent)

--Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
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