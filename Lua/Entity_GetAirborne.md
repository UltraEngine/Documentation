# Entity:GetAirborne

This method returns the current airborne state of an entity using player physics.

## Syntax

- boolean **GetAirborne**()

## Returns

Returns false if the player is standing on the ground, otherwise true is returned.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()
world:SetAmbientLight(0.42, 0.42, 0.5)
world:SetGravity(0, -30, 0)

-- Create light
local light = CreateDirectionalLight(world)
light:SetRotation(35, 35, 0)
light:SetColor(3)

-- Create the player
local player = CreatePivot(world)
player:SetPhysicsMode(PHYSICS_PLAYER)
player:SetMass(10)
player:SetCollisionType(COLLISION_PLAYER)
player:SetPosition(0, 10, 0)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 1, -8)
camera:SetFov(70)
camera:SetPosition(0, 1.6, 0)
camera:AddPostEffect(LoadPostEffect("Shaders/SSAO.fx"))
camera:SetPosition(player.position + Vec3(0, 1.7, 0))

-- Create the scene
local remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/"
local scene = LoadMap(world, remotepath .. "Maps/playertest.ultra")
local mtl = CreateMaterial()
mtl:SetColor(0.5,0.5,0.5)
for _, entity in pairs(scene.entities) do
    entity:SetMaterial(mtl, true)
end

-- For testing player weight on objects...
local box = CreateBox(world, 4, 0.1, 1)
box:SetPosition(1.75, 5, 2)
box:SetMass(1)
box:SetSweptCollision(true)

local camrotation = camera:GetRotation()
local mouseaxis = window:GetMouseAxis().xy
local lookspeed = 200
local movespeed = 3.5
local maxaccel = 40
local maxdecel = 15
local mousesmoothing = 3
local runspeed = 2
local jumpstrength = 12
local lunge = 1.5

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    if ActiveWindow() == window then
        -- Camera look
        local newaxis = window:GetMouseAxis().xy
        local mousedelta = newaxis - mouseaxis
        mouseaxis = newaxis
        camrotation.x = Mix(camrotation.x + mousedelta.y * lookspeed, camrotation.x, 1.0 / mousesmoothing)
        camrotation.x = Clamp(camrotation.x, -90.0, 90.0)
        camrotation.y = Mix(camrotation.y + mousedelta.x * lookspeed, camrotation.y, 1.0 / mousesmoothing)
        camera:SetRotation(camrotation, true)

        -- Movement
        local accel = maxaccel
        local movement = Vec2(0, 0)
        movement.y = (window:KeyDown(KEY_W) and 1 or 0) - (window:KeyDown(KEY_S) and 1 or 0)
        movement.x = (window:KeyDown(KEY_D) and 1 or 0) - (window:KeyDown(KEY_A) and 1 or 0)
        if movement.x ~= 0 and movement.y ~= 0 then
            -- Adjust speed on each axis if both are in use
            movement = movement * 0.7071
        end
        movement = movement * movespeed
        local jump = (window:KeyHit(KEY_SPACE) and jumpstrength) or 0
        local crouch = window:KeyDown(KEY_C)
        if player:GetAirborne() then jump = 0 end
        if not crouch and window:KeyDown(KEY_SHIFT) and not player:GetAirborne() then
            movement = movement * runspeed
        end
        if jump > 0 and not crouch then
            movement = movement * lunge
            accel = accel * 100
        end

        -- Set input
        player:SetInput(camrotation.y, movement.y, movement.x, jump, crouch, accel, maxdecel)
    end

    world:Update()

    -- Adjust camera position
    local eyeheight = 1.7
    if player:GetCrouched() then
        eyeheight = 1.8 * 0.5 - 0.1
    end
    camera:SetPosition(Mix(camera.position.x, player.position.x, 0.5), MoveTowards(camera.position.y, player.position.y + eyeheight, 0.1), Mix(camera.position.z, player.position.z, 0.5))
    camera:SetPosition(player.position.x, MoveTowards(camera.position.y, player.position.y + eyeheight, 0.1), camera.position.z)

    world:Render(framebuffer)
end
```
