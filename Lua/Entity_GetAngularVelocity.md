# Entity.GetAngularVelocity

This method retrieves the entity's angular velocity after the previous physics update, in degrees per second.

## Syntax

`function GetAngularVelocity() -> xVec3`

## Returns

Returns the entity's angular velocity, in degrees per second.

Example:
```lua
local angularVelocity = entity:GetAngularVelocity()
print("Angular Velocity:", angularVelocity)
```
In this example, the `GetAngularVelocity` method is called on an `entity` object to retrieve its angular velocity. The resulting angular velocity is then printed to the console.