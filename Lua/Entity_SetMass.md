# Entity:SetMass

This method sets the entity mass for physics interactivity.

## Syntax

```lua
function Entity:SetMass(mass: number)
```

Sets the mass of the entity.

- `mass`: The mass to set. Use 0 for immovable objects.

## Example

```lua
-- Create a world
local world = CreateWorld()

-- Create the ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

-- Add some boxes
local box1 = CreateBox(world)
box1:SetMass(1)
box1:SetPosition(0, 5, 0)
box1:SetElasticity(1)
box1:SetColor(0, 0, 1)

local box2 = CreateBox(world)
box2:SetMass(1)
box2:SetPosition(0.5, 6.5, 0)
box2:SetElasticity(0.25)
box2:SetColor(0, 0, 1)

-- Very slow gravity
world:SetGravity(0, -2, 0)

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```