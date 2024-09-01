# CreateParticleEmitter

This function creates a new particle emitter entity.

## Syntax

- [ParticlesEmitter](ParticlesEmitter.md) **CreateParticleEmitter**([World](World.md) world, number particles = 50)

| Parameter | Description |
|---|---|
| world | world to create the entity in |
| particles | number of particles, must be one or greater |

## Returns

Returns a new particle emitter.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CLIENTCOORDS | WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world)
camera:SetPosition(0, 4, -8)

-- Create a particle emitter with 50 particles
local emitter = CreateParticleEmitter(world, 50)
emitter:SetMaterial(LoadMaterial("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Particles/default.mat"))

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
