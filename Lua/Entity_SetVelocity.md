## Entity:SetVelocity

This method sets the velocity of an entity.

### Syntax

```lua
function Entity:SetVelocity(x, y, z, global)
```
```lua
function Entity:SetVelocity(velocity, global)
```

### Parameters

- **x, y, z**: The velocity to set, in meters per second.
- **velocity**: An [xVec3](xVec3.md) object representing the velocity to set.
- **global**: Optional. If set to true, the velocity is in global space. Otherwise, local space is used.

### Example

```lua
-- Set the velocity of entity 'myEntity' to (10, 0, 5)
myEntity:SetVelocity(10, 0, 5)

-- Set the velocity of entity 'myEntity' to (5, 0, -2) in local space
myEntity:SetVelocity(xVec3(5, 0, -2), false)
```