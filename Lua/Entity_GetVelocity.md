# Entity:GetVelocity

This method retrieves the entity velocity after the previous physics update, in global or local space.

---
## Syntax

`GetVelocity(global)`

## Parameters

- `global` (boolean) - If set to true, global space is used. If set to false, local space is used.

## Returns

Returns the entity's velocity as an `xVec3` object, in meters per second.

---
Example:

```lua
local velocity = entity:GetVelocity()
print(velocity.x, velocity.y, velocity.z)
```