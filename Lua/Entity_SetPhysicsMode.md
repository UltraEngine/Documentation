# Entity:SetPhysicsMode

This method selects the entity physics behavior.

## Syntax

```lua
function Entity:SetPhysicsMode(mode)
```

### Parameters

- `mode` (PhysicsMode): physics mode, can be `PHYSICS_NONE`, `PHYSICS_RIGIDBODY`, or `PHYSICS_PLAYER`

## Example

```lua
-- Create a new entity
local entity = Entity()

-- Set the physics mode to PHYSICS_RIGIDBODY
entity:SetPhysicsMode(PHYSICS_RIGIDBODY)
```