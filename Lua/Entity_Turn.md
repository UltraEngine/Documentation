# Entity:Turn

This method turns an entity. This will produce smooth rotation free from Gimbal lock problems that can occur when rotations are manually specified.

## Syntax

- **Turn**([xQuat](xQuat.md) rotation, boolean global = false)
- **Turn**([xVec3](xVec3.md) rotation, boolean global = false)
- **Turn**(number pitch, number yaw, number roll, boolean global = false)

| Parameter | Description |
| --- | --- |
| rotation, (pitch, yaw, roll) | rotation to apply |
| global | if set to true global space is used, otherwise local space is used |
