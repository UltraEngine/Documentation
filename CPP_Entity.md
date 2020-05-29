# Entity
An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Base Class
- [Object](CPP_Object.md)

## Derived Classes ##
* [Brush](CPP_Brush.md)
* [Camera](CPP_Camera.md)
* [Emitter](CPP_Emitter.md)
* [Light](CPP_Light.md)
* [Listener](CPP_Listener.md)
* [Model](CPP_Model.md)
* [Pivot](CPP_Pivot.md)
* [Terrain](CPP_Terrain.md)

## Members
* const [Vec3](API_Vec3)& position
* const Vec3& rotation
* const Quat& quaternion
* const Mat& matrix
* const Vec4& color
* wstring name

## Methods
* [GetParent](CPP_Entity_GetParent.md)
* [SetParent](CPP_Entity_SetParent.md)
* [SetPosition](CPP_Entity_SetPosition.md)
* [SetRotation](CPP_Entity_SetRotation.md)
* [SetScale](CPP_Entity_SetScale.md)
