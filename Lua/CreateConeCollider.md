# CreateConeCollider

This function creates a collision cone shape for physics interactions.

## Syntax
### CreateConeCollider(radius, height, x, y, z, pitch, yaw, roll)

- **radius** : number - radius of shape
- **height** : number - height of shape
- **x** : number - x component of shape offset (optional, default = 0)
- **y** : number - y component of shape offset (optional, default = 0)
- **z** : number - z component of shape offset (optional, default = 0)
- **pitch** : number - pitch of shape rotation (optional, default = 0)
- **yaw** : number - yaw of shape rotation (optional, default = 0)
- **roll** : number - roll of shape rotation (optional, default = 0)

### CreateConeCollider(radius, height, offset, rotation)

- **radius** : number - radius of shape
- **height** : number - height of shape
- **offset** : table - offset of shape
    - **x** : number - x component of offset
    - **y** : number - y component of offset
    - **z** : number - z component of offset
- **rotation** : table - rotation of shape (optional, default = 0)
    - **x** : number - x component of rotation
    - **y** : number - y component of rotation
    - **z** : number - z component of rotation

## Returns

Returns a new collider object.

## Example

```lua
--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, GetDisplays()[1], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create framebuffer
local framebuffer = CreateFramebuffer(window)

--Create world
local world = CreateWorld()

--Create camera
local camera = CreateCamera(world)
camera:SetFOV(70)
camera:Turn(15, 0, 0)
camera:Move(0, 2, -8)
camera:SetClearColor(0.125)

--Create light
local light = CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)

--Create ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetColor(0,1,0)
ground:SetPosition(0, -0.5, 0)

--Create model
local model = CreateCone(world, 0.5, 2)
model:SetPosition(0, 5, 0)
model:SetRotation(90, 0, 0)
model:SetColor(0, 0, 1)
model:SetMass(1)
model:AddForce(100, 0, 0)

--Create collision
local collider = CreateConeCollider(0.5, 2)
model:SetCollider(collider)

while not window:Closed() and not window:KeyHit(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end

return 0
```