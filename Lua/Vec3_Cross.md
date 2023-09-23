# Vec3:Cross

This method returns the cross product of this vector and the specified vector.

## Syntax

- [Vec3](Vec3.md) **Cross**([Vec3](Vec3.md) v)

| Parameter | Description |
|-|-|
|v|vector to return the cross product of.|

## Returns

Returns the cross product of this vector and the specified vector.

## Remarks

The cross product calculates a vector that is perpindicular to both input vectors. If both vectors are the same this method will return a vector with a length of zero.

## Example

```lua
local v0 = Vec3(1, 0, 0)
local v1 = Vec3(0, 1, 0)
local v2 = v0:Cross(v1)

Print(tostring(v2.x) .. ", " .. tostring(v2.y) .. ", " .. tostring(v2.z))
```
