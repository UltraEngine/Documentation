## Vec3:Reflect

This function bounces the vector off a specified normal vector and returns the result.

### Syntax

```lua
function Vec3:Reflect(normal)
```

- `normal` (Vec3): The surface normal to bounce the vector off of.

### Returns

- (Vec3): The reflected vector.

### Example

```lua
-- The motion is pointing down and forward
local motion = Vec3(0, -1, 1)

-- The ground is pointing up
local ground = Vec3(0, 1, 0)

-- Calculate bounce angle
local bounce = motion:Reflect(ground)

-- The bounce angle should be up and forward
print(bounce.x .. ", " .. bounce.y .. ", " .. bounce.z)
```