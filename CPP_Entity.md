# Entity
An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Base Class
* [Object](CPP_Object)

## Members
* const [Vec3](CPP_Vec3)& position
* const Vec3& rotation
* const Quat& quaternion
* const Mat& matrix
* const Vec4& color
* wstring name
* const shared_ptr<Material\>& material

## Methods
* [GetParent](GetParent.md)
* [SetParent](SetParent.md)
* [SetPosition](SetPosition.md)
* [SetRotation](SetRotation.md)
* [SetScale](SetScale.md)
