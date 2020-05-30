# CreateCollisionBox #
This function creates a collision box shape for physics interactions.

## Syntax ##
- [Collision](CPP_Collision.md) **CreateCollisionBox**(number width, number height, number depth)
- [Collision](CPP_Collision.md) **CreateCollisionBox**(number width, number height, number depth, number x, number y, number z)
- [Collision](CPP_Collision.md) **CreateCollisionBox**(number width, number height, number depth, number x, number y, number z, number pitch, number yaw, number roll)
- [Collision](CPP_Collision.md) **CreateCollisionBox**([Vec3](CPP_Vec3.md) size, [Vec3](CPP_Vec3.md) offset = 0, [Vec3](CPP_Vec3.md) rotation = 0)

## Parameters ##
|Name|Description|
|---|----|
|**width**|width of collision box|
|**height**|height of collision box|
|**depth**|depth of collision box|
|**x**|x component of collision box offset|
|**y**|y component of collision box offset|
|**z**|z component of collision box offset|
|**pitch**|pitch of collision box rotation|
|**yaw**|yaw of collision box rotation|
|**roll**|roll of collision box rotation|
|**size**|size of collision box|
|**offset**|offset of collision box|
|**rotation**|rotation of collision box|

## Returns ##
Returns a new collision object.
