# CreateCollisionBox #
This function creates a collision box shape for physics interactions.

## Syntax ##
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionBox**(const float width, const float height, const float depth, const float x = 0.0f, const float y = 0.0f, const float z = 0.0f, const float pitch = 0.0f, const float yaw = 0.0f, const float roll = 0.0f)
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionBox**(const [Vec3](CPP_Vec3.md)& size, const [Vec3](CPP_Vec3.md)& offset = 0.0f, const [Vec3](CPP_Vec3.md)& rotation = 0.0f)

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
