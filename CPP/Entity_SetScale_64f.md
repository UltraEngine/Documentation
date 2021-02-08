# Entity::SetScale
This method sets the scale of an entity in local 3-dimensional space.

## Syntax
* void **SetScale**(const double x, const double y, const double z)
* void **SetScale**(const double scale)
* void **SetScale**(const [dVec3](CPP_dVec3.md)& scale)

### Parameters
| Name | Description |
| ------ | ------ |
| **x** | X component of the specified scale |
| **y** | Y component of the specified scale |
| **z** | Z component of the specified scale |
| **scale** | the scale to set |

## Remarks ##
Scale can only be set in local space. Global scale values could potentially introduce shearing into the entity 4x4 matrices. which are required to be orthogonal.
