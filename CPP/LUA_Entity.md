# Entity
An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Base Class
* [Object](Object)

## Properties
* Vec3 position
* Vec3 rotation
* Quat quaternion
* Mat4 matrix
* Vec4 color
* wstring name

## Methods
* [GetParent](Entity_GetParent)
* [SetParent](Entity_SetParent)
* [SetPosition](Entity_SetPosition)
* [SetRotation](Entity_SetRotation)
* [SetScale](Entity_SetScale)