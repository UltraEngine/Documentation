# Entity

**Base class:** [Object](Object.md)

An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Properties

| Name | Type | Description |
|---|---|---|
| color | const [Vec4](Vec4.md)& | read-only object color |
| kids | vector<shared_ptr<[Entity](Entity.md)\> \>& | read-only array of child entities |
| name | [WString](WString.md) | name of the entity | 
| matrix | const [xMat4](xMat4.md)& | read-only 4x4 matrix |
| position | const [xVec3](xVec3.md)& | read-only position in local space |
| rotation | const [xVec3](xVec3.md)& | read-only Euler rotation in local space | 
| quaternion | const [xQuat](xQuat.md)& | read-only rotation in local space |
| scale | const [xVec3](xVec3.md)& | read-only scale |
| [AddForce](Entity_AddForce_32f.md) | Method | Applies a force, measured in Newtons, to an entity at a specified point. This can result in both movement and rotation of the entity. |
| [AddPointForce](Entity_AddPointForce_32f.md) |Method |  |
| [AddTorque](Entity_AddTorque_32f.md) |Method |  |
| [AlignToVector](Entity_AlignToVector_32f.md) |Method |  |
| [Copy](Entity_Copy.md) |Method |  |
| [FindChild](Entity_FindChild.md) |Method |  |
| [GetCollider](Entity_GetCollider.md) | Method | |
| [GetCollisionType](Entity_GetCollisionType.md) | Method | |
| [GetColor](Entity_GetColor.md) | Method | |
| [GetBounds](Entity_GetBounds_32f.md) |Method |  |
| [GetDistance](Entity_GetDistance_32f.md) |Method |  |
| [GetMass](Entity_GetMass_32f.md) |Method |  |
| [GetAngularVelocity](Entity_GetOmega_32f.md) | Method | |
| [GetEmission](GetEmission.md) |Method |  |
| [GetParent](Entity_GetParent.md) | Method | |
| [GetPickMode](Entity_GetPickMode.md) | Method | |
| [GetPosition](Entity_GetPosition_32f.md) |Method |  |
| [GetRotation](Entity_GetRotation_32f.md) | Method | |
| [GetQuaternion](Entity_GetQuaternion_32f.md) | Method | |
| [GetScale](Entity_GetScale_32f.md) | Method | |
| [GetShadowMode](Entity_GetShadowMode.md) |Method |  |
| [GetVelocity](Entity_GetVelocity_32f.md) |Method |  |
| [GetWorld](Entity_GetWorld.md) | Method | |
| [Hide](Entity_Hide.md) |Method |  |
| [Hidden](Entity_Hidden.md) | Method | |
| [Instantiate](Entity_Instantiate.md) |Method |  |
| [Move](Entity_Move_32f.md) | Method | |
| [Pick](Entity_Pick_32f.md) | Method | |
| [Point](Entity_Point_32f.md) | Method | |
| [Reset](Entity_Reset.md) | Method | |
| [RecordCollisions](Entity_RecordCollisions.md) | Method | sets the recording mode for entity collision detection |
| [SetCollision](Entity_SetCollision.md) |Method |  |
| [SetCollisionType](Entity_SetCollisionType.md) | Method | |
| [SetColor](Entity_SetColor.md) | Method | |
| [SetMass](Entity_SetMass.md) | Method | |
| [SetAngularVelocity](Entity_SetOmega_32f.md) |Method |  |
| [SetParent](Entity_SetParent.md) | Method | |
| [SetPickMode](Entity_SetPickMode.md) | Method | |
| [SetPosition](Entity_SetPosition_32f.md) | Method | |
| [SetRotation](Entity_SetRotation_32f.md) | Method | |
| [SetScale](Entity_SetScale_32f.md) | Method | |
| [SetVelocity](Entity_SetVelocity_32f.md) | Method | |
| [Show](Entity_Show.md) | Method | |
| [Translate](Entity_Translate_32f.md) | Method | |
| [Turn](Entity_Turn_32f.md) | Method | |
