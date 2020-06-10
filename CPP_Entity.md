# Entity
An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Base Class
- [Object](CPP_Object.md)

## Derived Classes ##
- [Brush](CPP_Brush.md)
- [Camera](CPP_Camera.md)
- [Emitter](CPP_Emitter.md)
- [Light](CPP_Light.md)
- [Listener](CPP_Listener.md)
- [Model](CPP_Model.md)
- [Pivot](CPP_Pivot.md)
- [Terrain](CPP_Terrain.md)

## Members
- wstring name
- const [Vec3](CPP_Vec3.md)& position
- const [Vec3](CPP_Vec3.md)& rotation
- const [Quat](CPP_Quat.md)& quaternion
- const [Vec3](CPP_Vec3.md)& scale
- const [Mat4](CPP_Mat4.md)& matrix
- const [Vec4](CPP_Vec4.md)& color
- vector<shared_ptr<[Entity](CPP_Entity.md)\> \>& kids

## Methods
* [AddForce](CPP_Entity_AddForce.md)
* [AddScript](CPP_Entity_AddScript.md)
* [AddTorque](CPP_Entity_AddTorque.md)
* [AddPointForce](CPP_Entity_AddPointForce.md)
* [Attach](CPP_Entity_Attach.md)
* [Detach](CPP_Entity_Detach.md)
* [FindChild](CPP_Entity_FondChild.md)
* [GetDistance](CPP_Entity_GetDistance.md)
* [GetMass](CPP_Entity_GetMass.md)
* [GetParent](CPP_Entity_GetParent.md)
* [Hide](CPP_Entity_Hide.md)
* [Reset](CPP_Entity_Reset.md)
* [SetMass](CPP_Entity_SetMass.md)
* [SetParent](CPP_Entity_SetParent.md)
* [SetPosition](CPP_Entity_SetPosition.md)
* [SetRotation](CPP_Entity_SetRotation.md)
* [SetMass](CPP_Entity_SetMass.md)
* [SetScale](CPP_Entity_SetScale.md)
* [Show](CPP_Entity_Show.md)
* [Translate](CPP_Entity_Translate.md)
