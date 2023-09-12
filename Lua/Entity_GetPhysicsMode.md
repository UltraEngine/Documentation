# Entity:GetPhysicsMode

This method gets the entity physics behavior.

## Syntax

- number **GetPhysicsMode**()

## Returns

Returns `PHYSICS_NONE`, `PHYSICS_RIGIDBODY`, or `PHYSICS_PLAYER`.

## Example

```lua
local entity = Entity()

-- Set physics mode to rigidbody
entity:SetPhysicsMode(PHYSICS_RIGIDBODY)

-- Get the current physics mode
local physicsMode = entity:GetPhysicsMode()

if physicsMode == PHYSICS_NONE then
    print("Physics Mode: None")
elseif physicsMode == PHYSICS_RIGIDBODY then
    print("Physics Mode: Rigidbody")
elseif physicsMode == PHYSICS_PLAYER then
    print("Physics Mode: Player")
end
```