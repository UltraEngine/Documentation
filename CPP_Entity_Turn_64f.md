# Entity::Turn #
This method turns an entity. This will produce smooth rotation free from Gimbal lock problems that can occur when rotations are manually specified.

## Syntax ##
- void **Turn**(const double pitch, const double yaw, const double roll, const bool global = false)
- void **Turn**(const [dVec3](CPP_dVec3.md)& rotation, const bool global = false)
- void **Turn**(const [dQuat](CPP_dQuat.md)& rotation, const bool global = false)

### Parameters ###
| Name | Description |
| --- | --- |
| **pitch** | x component of the rotation |
| **yaw** | y component of the rotation |
| **roll** | z component of the rotation |
| **rotation** | translation vector |
| **global** | if set to true global space is used, otherwise local space is used |
