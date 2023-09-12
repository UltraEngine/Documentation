# NavAgent.Navigate

This method plots a path to the specified point and directs the navigation agent to move there.

## Syntax

- **Navigate**(position: [Vec3](Vec3.md)): boolean
- **Navigate**(x: number, y: number, z: number): boolean

| Parameter | Description |
|---|---|
| position (x, y, z) | destination position to navigate to |

## Returns

Returns true if a path was plotted to the destination, otherwise false is returned.

## Example

```lua
-- Get the displays
local displays = UltraEngine.GetDisplays()

-- Create a window
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], UltraEngine.WINDOW_CENTER + UltraEngine.WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = UltraEngine.CreateFramebuffer(window)

-- Create a world
local world = UltraEngine.CreateWorld()

-- Create a camera
local camera = UltraEngine.CreateCamera(world)
camera:SetFOV(70)
camera:SetClearColor(0.125)
camera:SetPosition(0, 3, -6)
camera:SetRotation(35, 0, 0)

-- Create light
local light = UltraEngine.CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

-- Create scene
local ground = UltraEngine.CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)
local wall = UltraEngine.CreateBox(world, 1, 2, 4)

-- Create navmesh
local navmesh = UltraEngine.CreateNavMesh(world, 10, 5, 10, 4, 4)
navmesh:Build()

-- Create player
local player = UltraEngine.CreateCylinder(world, 0.4, 1.8)
player:SetNavObstacle(false)
player:SetColor(0, 0, 1)
local agent = UltraEngine.CreateNavAgent(navmesh)
player:Attach(agent)

-- Main loop
while (window:Closed() == false and window:KeyDown(UltraEngine.KEY_ESCAPE) == false) do
    if (window:MouseHit(UltraEngine.MOUSE_LEFT)) then
        local mousepos = window:GetMousePosition()
        local rayinfo = camera:Pick(framebuffer, mousepos.x, mousepos.y)
        if (rayinfo.success) then
            agent:Navigate(rayinfo.position)
        end
    end

    world:Update()
    world:Render(framebuffer)
end

return 0
```