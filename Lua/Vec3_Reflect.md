# Vec3:Reflect

This function bounces the vector off a specified normal vector and returns the result.

## Syntax

- [Vec3](Vec3.md) **Reflect**([Vec3](Vec3.md) normal)

| Parameter | Description |
|---|---|
| normal | surface normal to reflect off of |

## Returns

Returns the reflected vector.

## Example

```lua
-- The motion is pointing down and forward
local motion = Vec3(0, -1, 1)

-- The ground is pointing up
local ground = Vec3(0, 1, 0)

-- Calculate bounce angle
local bounce = motion:Reflect(ground)

-- The bounce angle should be up and forward
Print(bounce.x .. ", " .. bounce.y .. ", " .. bounce.z)
```
