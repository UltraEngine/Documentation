# Entity
An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Base Class
- [Object](Object.md)

## Derived Classes ##
- [Brush](Brush.md)
- [Camera](Camera.md)
- [Emitter](Emitter.md)
- [Light](Light.md)
- [Listener](Listener.md)
- [Model](Model.md)
- [Pivot](Pivot.md)
- [Terrain](Terrain.md)

## Members
- wstring name
- const [dVec3](dVec3.md)& position
- const [dVec3](dVec3.md)& rotation
- const [dQuat](dQuat.md)& quaternion
- const [dVec3](dVec3.md)& scale
- const [dMat4](dMat4.md)& matrix
- const [Vec4](Vec4.md)& color
- vector<shared_ptr<[Entity](Entity_32f.md)\> \>& kids

## Methods ##
* [AddActor](Entity_AddActor.md)
* [AddForce](Entity_AddForce_32f.md)
* [AddPointForce](Entity_AddPointForce_32f.md)
* [AddScript](Entity_AddScript.md)
* [AddTorque](Entity_AddTorque_32f.md)
* [AlignToVector](Entity_AlignToVector_32f.md)
* [Attach](Entity_Attach.md)
* [Copy](Entity_Copy.md)
* [Detach](Entity_Detach.md)
* [FindChild](Entity_FindChild.md)
* [GetCollision](Entity_GetCollision.md)
* [GetCollisionType](Entity_GetCollisionType.md)
* [GetColor](Entity_GetColor.md)
* [GetBounds](Entity_GetBounds_32f.md)
* [GetDistance](Entity_GetDistance_32f.md)
* [GetMass](Entity_GetMass_32f.md)
* [GetOmega](Entity_GetOmega_32f.md)
* [GetParent](Entity_GetParent.md)
* [GetPickMode](Entity_GetPickMode.md)
* [GetPosition](Entity_GetPosition_64f.md)
* [GetRotation](Entity_GetRotation_64f.md)
* [GetQuaternion](Entity_GetQuaternion_64f.md)
* [GetScale](Entity_GetScale_64f.md)
* [GetShadowMode](Entity_GetShadowMode.md)
* [GetWorld](Entity_GetWorld.md)
* [GetVelocity](Entity_GetVelocity_32f.md)
* [Hide](Entity_Hide.md)
* [Hidden](Entity_Hidden.md)
* [Instantiate](Entity_Instantiate.md)
* [MakeStatic](Entity_MakeStatic.md)
* [Move](Entity_Move_32f.md)
* [Pick](Entity_Pick_32f.md)
* [Point](Entity_Point_32f.md)
* [Reset](Entity_Reset.md)
* [SetCollision](Entity_SetCollision.md)
* [SetCollisionType](Entity_SetCollisionType.md)
* [SetColor](Entity_SetColor.md)
* [SetMass](Entity_SetMass.md)
* [SetOmega](Entity_SetOmega_32f.md)
* [SetParent](Entity_SetParent.md)
* [SetPickMode](Entity_SetPickMode.md)
* [SetPosition](Entity_SetPosition_32f.md)
* [SetRotation](Entity_SetRotation_32f.md)
* [SetScale](Entity_SetScale_32f.md)
* [SetShadowMode](Entity_SetShadowMode.md)
* [SetVelocity](Entity_SetVelocity_32f.md)
* [Show](Entity_Show.md)
* [Translate](Entity_Translate_32f.md)
* [Turn](Entity_Turn_32f.md)