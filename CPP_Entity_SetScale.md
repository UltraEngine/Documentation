# Entity::SetScale
This method sets the scale of an entity in local 3-dimensional space.

## Syntax
* void **SetScale**(const float x, const float y, const float z)
* void **SetScale**(const Vec3& scale)
* void **SetScale**(const float scale)
* void **SetScale**(const double x, const double y, const double z)
* void **SetScale**(const dVec3& scale)
* void **SetScale**(const double scale)

### Parameters
| Name | Description |
| ------ | ------ |
| **x** | X component of the specified scale. |
| **y** | Y component of the specified scale. |
| **z** | Z component of the specified scale. |
| **scale** | the scale to set. |

## Remarks ##
Scale can only be set in local space. Global scale values could potentially introduce shearing into the entity 4x4 matrices. All 4x4 matrices in the engine are required to be orthogonal.
