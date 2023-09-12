# Entity:SetPosition

This method sets the position of an entity in 3-dimensional space, using local or global coordinates.

An entity can be positioned in local or global coordinates. Local coordinates are relative to the entity parent's space. If the entity does not have a parent, local and global coordinates are the same.

The engine uses a left-handed coordinate system. The X axis points to the right, the Y axis points up, and the Z axis points forward.

## Syntax

- Entity:SetPosition(position, global)
- Entity:SetPosition(position, global)
- Entity:SetPosition(x, y, z, global)

### Parameters

| Parameter | Description |
| ------ | ------ |
| position, (x, y, z) | The position to set |
| global | Indicates whether the position should be set in global or local space |

### Example

```lua
-- Set position in local space
entity:SetPosition({10, 0, 5})

-- Set position in global space
entity:SetPosition({-3, 2, 0}, true)

-- Set position using separate x, y, and z coordinates in local space
entity:SetPosition(1, -2, 7)

-- Set position using separate x, y, and z coordinates in global space
entity:SetPosition(4, 0, 9, true)
```