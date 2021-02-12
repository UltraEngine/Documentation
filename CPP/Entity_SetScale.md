# Entity::SetScale
This method sets the scale of an entity on all three axes.

### Syntax
* void SetScale(const float x, const float y, const float z)
* void SetScale(const Vec3& scale)
* void SetScale(const float scale)

### Parameters
| Name | Description |
| ------ | ------ |
| x | X component of the specified scale. |
| y | Y component of the specified scale. |
| z | Z component of the specified scale. |
| scale | the scale to set, either a Vec3 or a uniform scale value. |

# Example
* [Entity Orientation](EntityOrientation.cpp)