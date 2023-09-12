### Plane:IntersectsLine

This method tests if the plane intersects a line or line segment.

#### Syntax

```lua
function Plane:IntersectsLine(p0, p1, result, twosided, infinite)
```

#### Parameters

- `p0` (Vec3): starting point
- `p1` (Vec3): end point
- `result` (Vec3): storage for intersection point
- `twosided` (boolean, optional): if true the plane will be considered two-sided and the direction of the line will not matter
- `infinite` (boolean, optional): if true, an infinite line will be tested, otherwise only the line segment will be tested

#### Returns

- (boolean) True if the line intersects the plane, false otherwise.
- (Vec3) The intersection point is stored in the `result` variable if the line intersects the plane.

## Example

```lua
-- Create a plane
local plane = Plane.new()

-- Define the starting and end points of the line
local p0 = Vec3.new(0, 0, 0)
local p1 = Vec3.new(1, 1, 1)

-- Create a Vec3 to store the intersection point
local result = Vec3.new()

-- Check if the line intersects the plane
local intersects = plane:IntersectsLine(p0, p1, result)

-- Print the result
if intersects then
    print("The line intersects the plane at point:", result.x, result.y, result.z)
else
    print("The line does not intersect the plane.")
end
```