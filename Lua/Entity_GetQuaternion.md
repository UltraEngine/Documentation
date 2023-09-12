# Entity:GetQuaternion

This method retrieves the entity rotation as a quaternion.

## Syntax

```lua
function Entity:GetQuaternion(global)
```

### Parameters

- `global` (optional): If set to `false`, the rotation relative to the parent is returned. If not provided or set to `true`, the rotation in world space is returned.

## Returns

Returns the entity rotation as a quaternion.