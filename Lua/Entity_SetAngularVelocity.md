## Entity:setAngularVelocity

This method sets the angular velocity of an entity.

```lua
function Entity:setAngularVelocity(omega, recursive)
```

### Parameters

- `omega` (table or number): The angular velocity to set, in degrees per second. If provided as a table, it should have the properties `x`, `y`, and `z`, representing the angular velocities along the x, y, and z axes respectively. If provided as individual numbers, they represent the angular velocities along the x, y, and z axes respectively.
- `recursive` (boolean, optional): If set to `true`, the angular velocity is applied recursively to all child entities. Defaults to `true`.

### Example

```lua
-- Setting the angular velocity as a table
local omegaTable = {x = 25, y = 50, z = 75}
entity:setAngularVelocity(omegaTable)

-- Setting the angular velocity as individual numbers
entity:setAngularVelocity(10, 20, 30)
```