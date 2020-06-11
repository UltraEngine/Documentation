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

## Methods ##
* [AddActor](CPP_Entity_AddActor.md)
* [AddForce](CPP_Entity_AddForce_32f.md)
* [AddPointForce](CPP_Entity_AddPointForce_32f.md)
* [AddScript](CPP_Entity_AddScript.md)
* [AddTorque](CPP_Entity_AddTorque_32f.md)
* [AlignToVector](CPP_Entity_AlignToVector_32f.md)
* [Attach](CPP_Entity_Attach.md)
* [Copy](CPP_Entity_Copy.md)
* [Detach](CPP_Entity_Detach.md)
* [FindChild](CPP_Entity_FindChild.md)
* [GetCollision](CPP_Entity_GetCollision.md)
* [GetCollisionType](CPP_Entity_GetCollisionType.md)
* [GetColor](CPP_Entity_GetColor.md)
* [GetBounds](CPP_Entity_GetBounds_32f.md)
* [GetDistance](CPP_Entity_GetDistance_32f.md)
* [GetMass](CPP_Entity_GetMass_32f.md)
* [GetOmega](CPP_Entity_GetOmega_32f.md)
* [GetParent](CPP_Entity_GetParent.md)
* [GetPickMode](CPP_Entity_GetPickMode.md)
* [GetQuaternion](CPP_Entity_GetQuaternion_32f.md)
* [GetShadowMode](CPP_Entity_GetShadowMode.md)
* [GetVelocity](CPP_Entity_GetVelocity_32f.md)
* [Hide](CPP_Entity_Hide.md)
* [Hidden](CPP_Entity_Hidden.md)
* [Instantiate](CPP_Entity_Instantiate.md)
* [MakeStatic](CPP_Entity_MakeStatic.md)
* [Move](CPP_Entity_Move_32f.md)
* [Pick](CPP_Entity_Pick_32f.md)
* [Point](CPP_Entity_Point_32f.md)
* [Reset](CPP_Entity_Reset.md)
* [SetCollision](CPP_Entity_SetCollision.md)
* [SetCollisionType](CPP_Entity_SetCollisionType.md)
* [SetColor](CPP_Entity_SetColor.md)
* [SetMass](CPP_Entity_SetMass.md)
* [SetOmega](CPP_Entity_SetOmega_32f.md)
* [SetParent](CPP_Entity_SetParent.md)
* [SetPickMode](CPP_Entity_SetPickMode.md)
* [SetPosition](CPP_Entity_SetPosition_32f.md)
* [SetRotation](CPP_Entity_SetRotation_32f.md)
* [SetScale](CPP_Entity_SetScale_32f.md)
* [SetShadowMode](CPP_Entity_SetShadowMode.md)
* [SetVelocity](CPP_Entity_SetVelocity_32f.md)
* [Show](CPP_Entity_Show.md)
* [Translate](CPP_Entity_Translate_32f.md)
* [Turn](CPP_Entity_Turn_32f.md)
