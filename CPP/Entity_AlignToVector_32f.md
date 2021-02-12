# Entity::AlignToVector #
This method will align one axis of an entity along a specified vector in global space.

## Syntax ##
- void **AlignToVector**(const float x, const float y, const float z, const int axis = 2, const float rate = 1.0, const float roll = 0.0)
- void **AlignToVector**(const [Vec3](Vec3.md)& v, const int axis = 2, const float rate = 1.0, const float roll = 0.0)

### Parameters ###
| Name | Description |
| --- | --- |
| **x** | x component of the alignment vector  |
| **y** | y component of the alignment vector |
| **z** | z component of the alignment vector  |
| **v** | alignment vector  |
| **axis** | entity axis to align to the vector (0, 1, or 2) |
| **rate** | can be used to gradually align vector |
| **roll** | rotation around axis |