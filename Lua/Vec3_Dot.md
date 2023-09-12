# Vec3:Dot

This method returns the dot product of this vector and the specified vector.

## Syntax

```lua
function Vec3:Dot(v: Vec3): number
```

### Parameters

- `v: Vec3`: vector to return the dot product of.

## Remarks

The dot product is a measure of how similar two vector are. If the vectors point in the opposite direction, the dot product is -1. If the two vector are identical the dot product is 1. If the two vector are perpindicular, the dot product is 0.

## Returns

Returns the dot product of this vector and the specified vector.

## Example

```lua
local v0 = Vec3(1, 0, 0)
local v1 = Vec3(-1, 0, 0)

Print(v0:Dot(v1))
```