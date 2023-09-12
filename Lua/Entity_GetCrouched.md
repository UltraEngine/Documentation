# Entity:GetCrouched

This method returns the current crouch state of an entity using player physics.

## Syntax

```lua
function Entity:GetCrouched() -> boolean
```

## Returns

Returns true if the player input has set the crouch state to true or if the player is unable to stand up, otherwise false is returned.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()
world:SetAmbientLight(0.42, 0.42, 0.5)
world:SetGravity(0, -30, 0)

-- Set environment
local remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/"
world:SetEnvironmentMap(LoadTexture(remotepath .. "Materials/Environment/Storm/specular.dds"), ENVIRONMENTMAP_BACKGROUND)
world:SetEnvironmentMap(LoadTexture(remotepath .. "Materials/Environment/Storm/specular.dds"), ENVIRONMENTMAP_SPECULAR)
world:SetEnvironmentMap(LoadTexture(remotepath .. "Materials/Environment/Storm/diffuse.dds"), ENVIRONMENTMAP_DIFFUSE)

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
camera:SetFOV(70)
camera:SetPosition(0, 1.6, 0)
--camera:SetParent(player, false)
camera:AddPostEffect(LoadPostEffect("Shaders/PostEffects/SSAO.json"))
camera:AddPostEffect(LoadPostEffect("Shaders/PostEffects/FXAA.json"))
camera:AddPostEffect(LoadPostEffect("Shaders/PostEffects/Bloom.json"))
camera:SetPosition(player.position + Vec3(0, 1.7, 0))

-- Create the scene
local mtl = CreateMaterial()
mtl:SetTexture(LoadTexture(remotepath .. "Materials/Developer/graygrid.dds"))
local scene = LoadScene(world, remotepath .. "Maps/playertest.map")
for _, entity in ipairs(scene.entities) do
    entity:SetMaterial(mtl, true)
end

-- For testing player weight on objects...
local box
box = CreateBox(world, 4, 0.1, 1)
box:SetPosition(1.75, 5, 2)
box:SetMass(1)
box:SetSweptCollision(true)

local camrotation = camera:GetRotation()
local mouseaxis = window:GetMouseAxis()
local lookspeed = 200
local movespeed = 3.5
local maxaccel = 40
local maxdecel = 15
local mousesmoothing = 3
local runspeed = 2
local jumpstrength = 12
local lunge = 1.5

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    if ActiveWindow() == window then
        -- Camera look
        local newaxis = window:GetMouseAxis()
        local mousedelta = newaxis - mouseaxis
        mouseaxis = newaxis
        camrotation.x = Mix(camrotation.x + mousedelta.y * lookspeed, camrotation.x, 1.0 / mousesmoothing)
        camrotation.x = Clamp(camrotation.x, -90.0, 90.0)
        camrotation.y = Mix(camrotation.y + mousedelta.x * lookspeed, camrotation.y, 1.0 / mousesmoothing)
        camera:SetRotation(camrotation, true)

        -- Movement 
        local accel = maxaccel
        local movement = Vec2()
        movement.y = (window:KeyDown(KEY_W) - window:KeyDown(KEY_S))
        movement.x = (window:KeyDown(KEY_D) - window:KeyDown(KEY_A))
        if movement.x ~= 0.0 and movement.y ~= 0.0 then
            -- Adjust speed on each axis if both are in use
            movement = movement * 0.7071
        end
        movement = movement * movespeed
        local jump = window:KeyHit(KEY_SPACE) * jumpstrength
        local crouch = window:KeyDown(KEY_C)
        if player:GetAirborne() then jump = 0 end
        if crouch == false and window:KeyDown(KEY_SHIFT) and not player:GetAirborne() then
            movement = movement * runspeed
        end
        if jump > 0 and crouch == false then
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

return 0
```