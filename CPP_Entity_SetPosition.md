# Entity::SetPosition
This method sets the position of an entity in 3-dimensional space, using local or global coordinates.
ion, const bool global = false)

## Syntax

### C++
* void SetPosition(const float x, const float y, const float z, const bool global = false)
* void SetPosition(const Vec3& posit

### C#
* void SetPosition(float x, float y, float z, bool global = false)
* void SetPosition(Vec3 posit

### Lua
* SetPosition(number x, number y, number z, boolean global = false)
* SetPosition(Vec3 position, boolean = false)

### Parameters
| Name | Description |
| ------ | ------ |
| x | X component of the specified position. |
| y | Y component of the specified position. |
| z | Z component of the specified position. |
| position | the position to set. |
| global | indicates whether the position should be set in global or local space. |

## Remarks
An entity can be positioned in local or global coordinates. Local coordinates are relative to the entity parent's space. If the entity does not have a parent, local and global coordinates are the same.

The engine uses a left-handed coordinate system. The X axis points right, the Y axis points up, and the Z axis points forward.
