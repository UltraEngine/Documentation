# CreateCollisionBox #
This function creates a collision box shape for physics interactions.

## Syntax ##
- [Collision](CPP_Collision.md) **CreateCollisionBox**(number w, number h, number d)
- [Collision](CPP_Collision.md) **CreateCollisionBox**(number w, number h, number d, number x, number y, number z)
- [Collision](CPP_Collision.md) **CreateCollisionBox**(number w, number h, number d, number x, number y, number z, number rx, number ry, number rz)
- [Collision](CPP_Collision.md) **CreateCollisionBox**([Vec3](CPP_Vec3.md) size, [Vec3](CPP_Vec3.md) offset = 0, [Vec3](CPP_Vec3.md) rotation = 0)

## Parameters ##
|Name|Description|
|---|----|
|**w**|width of collision box|
|**h**|height of collision box|
|**d**|depth of collision box|
|**x**|x component of collision box offset|
|**y**|y component of collision box offset|
|**z**|z component of collision box offset|
|**rx**|pitch of collision box rotation|
|**ry**|yaw of collision box rotation|
|**rz**|roll of collision box rotation|
|**size**|size of collision box|
|**offset**|offset of collision box|
|**rotation**|rotation of collision box|

## Returns ##
Returns a new collision object.
