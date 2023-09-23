# Vec3:Dot

This method returns the dot product of this vector and the specified vector.

## Syntax

- number **Dot**([Vec3](Vec3.md) v)

| Parameter | Description |
|-|-|
|v|vector to return the dot product of.|

## Remarks

The dot product is a measure of how similar two vector are. If the vectors point in the opposite direction, the dodt product is -1. If the two vector are identical the dot product is 1. If the two vector are perpindicular, the dot product is 0.

## Returns

Returns the dot product of this vector and the specified vector.

## Example

```lua
local v0 = Vec3(1, 0, 0)
local v1 = Vec3(-1, 0, 0)

Print(v0:Dot(v1))
```
