# Entity
An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Base Class
- [Object](API_Object)

## Derived Classes ##
* [Model](API_Model)

## Members
* const [Vec3](API_Vec3)& position
* const Vec3& rotation
* const Quat& quaternion
* const Mat& matrix
* const Vec4& color
* wstring name

## Methods
* [GetParent](API_Entity_GetParent.md)
* [SetParent](API_Entity_SetParent.md)
* [SetPosition](API_Entity_SetPosition.md)
* [SetRotation](API_Entity_SetRotation.md)
* [SetScale](API_Entity_SetScale.md)
