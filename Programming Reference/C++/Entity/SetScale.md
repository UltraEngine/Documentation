# Entity::SetScale
This method sets the scale of an entity on all three axes.

### Syntax
* void SetRotation(const float x, const float y, const float z)
* void SetRotation(const Vec3& scale)
* void SetRotation(const float scale)

### Parameters
| Name | Description |
| ------ | ------ |
| pitch | X component of the specified scale. |
| yaw | Y component of the specified scale. |
| roll | Z component of the specified scale. |
| scale | the scale to set, either a Vec3 or a uniform scale value. |

# Example
* [Entity Orientation](EntityOrientation.cpp)
