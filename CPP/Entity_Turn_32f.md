# Entity::Turn #
This method turns an entity. This will produce smooth rotation free from Gimbal lock problems that can occur when rotations are manually specified.

## Syntax ##
- void **Turn**(const float pitch, const float yaw, const float roll, const bool global = false)
- void **Turn**(const [Vec3](Vec3.md)& rotation, const bool global = false)
- void **Turn**(const [Quat](Quat.md)& rotation, const bool global = false)

### Parameters ###
| Name | Description |
| --- | --- |
| **pitch** | x component of the rotation |
| **yaw** | y component of the rotation |
| **roll** | z component of the rotation |
| **rotation** | translation vector |
| **global** | if set to true global space is used, otherwise local space is used |