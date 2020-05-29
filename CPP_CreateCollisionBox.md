# CreateCollisionBox #
This function creates a collision box shape for physics interactions.

## Syntax ##
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionBox**(const float width, const float height, const float depth, const float x = 0.0f, const float y = 0.0f, const float z = 0.0f, const float pitch = 0.0f, const float yaw = 0.0f, const float roll = 0.0f)
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionBox**(const [Vec3](CPP_Vec3.md)& size, const [Vec3](CPP_Vec3.md)& offset = Vec3(0.0f), const [Vec3](CPP_Vec3.md)& rotation = Vec3(0.0f))

## Parameters ##
|Name|Description|
|---|----|
|**width**|width of collision box|
|**height**|height of collision box|
|**depth**|depth of collision box|
|**pitch**|width of collision box|
|**yaw**|height of collision box|
|**roll**|depth of collision box|
|**x**|size of collision box|
|**y**|size of collision box|
|**z**|size of collision box|

## Returns ##
Returns a new collision object.
