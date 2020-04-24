# Entity::SetPosition
This method sets the position of an entity in 3-dimensional space, using local or global coordinates.

### Syntax
* void SetPosition(const float x, const float y, const float z, const bool global = false)
* void SetPosition(const Vec3& position, const bool global = false)

### Parameters
| Name | Description |
| ------ | ------ |
| x | X component of the specified position. |
| y | Y component of the specified position. |
| z | Z component of the specified position. |
| position | the position to set. |
| global | indicates whether the position should be set in global or local space. |

### Remarks
An entity can be positioned in local or global coordinates. Local coordinates are relative to the entity parent's space. If the entity does not have a parent, local and global coordinates are the same.

Leadwerks uses a left-handed coordinate system.  This means that if you hold your left hand as shown below, your middle finger, index finger, and thumb will point in the directions of the X, Y, and Z axes, respectively.
