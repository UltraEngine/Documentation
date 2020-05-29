[Documentation](learn) > [Programming Reference](CPP_Entity.md) > [Entity](CPP_Entity.md)

# [Entity](CPP_Entity.md)::SetRotation
This method sets the rotation of an entity in 3-dimensional space, using local or global space.

### Syntax
* void SetRotation(const float pitch, const float yaw, const float roll, const bool global = false)
* void SetRotation(const Vec3& rotation, const bool global = false)

### Parameters
| Name | Description |
| ------ | ------ |
| pitch | X component of the specified rotation. |
| yaw | Y component of the specified rotation. |
| roll | Z component of the specified rotation. |
| position | the position to set. |
| global | indicates whether the rotation should be set in global or local space. |

### Remarks
An entity can be rotated in local or global space. Local space is relative to the entity parent's space. If the entity does not have a parent, local and global rotation is the same.

The engine uses a left-handed rotation system. Positive pitch turns an object down. Positive yaw turns to the right. Positive roll rolls to the left.
