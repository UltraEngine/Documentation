# Vec3:Inverse

This method returns the inverse of this vector.

---

## Syntax

```lua
function Vec3:Inverse()
```

---

## Returns

Returns the inverse vector.

---

## Example

```lua
-- Assuming Vec3 is already imported

local v = Vec3(1, 2, 3)
v = v:Inverse()

Print(v.x .. ", " .. v.y .. ", " .. v.z)
```