# Bone:SetPosition

This method can be used to manually rotate a bone. You can control skinned models entirely in code or apply your own movements on top of animation.

---

## Syntax

- **Bone:SetPosition**(x: number, y: number, z: number, global: boolean = false)
- **Bone:SetPosition**(position: [Vec3](Vec3.md), global: boolean = false)

---

| Parameter | Description |
|---|---|
| position, (pitch, yaw, roll) | position to set |
| global | if set to true, position is relative to the skeleton; otherwise, it is relative to the bone's parent |

---

## Remarks

To combine programmatic movement with animation, this method should be called after **World:Update** and before **World:Render**.

---

## Example

```lua
-- Create a bone object
local bone = Bone()

-- Set the bone's position using individual coordinates
bone:SetPosition(1.0, 2.0, 3.0)

-- Set the bone's position using a Vec3 object
local position = Vec3(4.0, 5.0, 6.0)
bone:SetPosition(position)
```
