# Vec2:Normalize
```lua
function Vec2:Normalize()
```

This method returns the normalized vector. The resulting vector will have a length of one.

## Returns

Returns the normalized vector. If the magnitude of this vector is zero, a vector with zero length will be returned.

## Example

```lua
v = Vec2(3, 5)
v = v:Normalize()
Print(tostring(v.x) .. ", " .. tostring(v.y))
```