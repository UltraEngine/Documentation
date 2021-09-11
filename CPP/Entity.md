# Entity

**Base class:** [Object](Object.md)

An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Properties

| Name | Type | Description |
|---|---|---|
| color | const [Vec4](Vec4.md)& | read-only object color |
| kids | const vector<shared_ptr<[Entity](Entity.md)\> \>& | read-only array of child entities |
| name | [WString](WString.md) | name of the entity | 
| matrix | const [xMat4](xMat4.md)& | read-only 4x4 matrix |
| position | const [xVec3](xVec3.md)& | read-only position in local space |
| rotation | const [xVec3](xVec3.md)& | read-only Euler rotation in local space | 
| quaternion | const [xQuat](xQuat.md)& | read-only rotation in local space |
| scale | const [xVec3](xVec3.md)& | read-only scale |
| [AddForce](Entity_AddForce.md) | Method | Applies a force, measured in Newtons, to an entity at a specified point. This can result in both movement and rotation of the entity. |
| [AddPointForce](Entity_AddPointForce.md) | Method |  |
[3dkit] | [AddComponent](Entity_AddComponent.md) | Method |  |
| [AddTorque](Entity_AddTorque.md) | Method |  |
| [AlignToVector](Entity_AlignToVector.md) | Method |  |
| [Copy](Entity_Copy.md) | Method |  |
| [FindChild](Entity_FindChild.md) | Method |  |
| [GetAngularVelocity](Entity_GetAngularVelocity.md) | Method | |
| [GetCollider](Entity_GetCollider.md) | Method | |
| [GetCollisionType](Entity_GetCollisionType.md) | Method | |
| [GetColor](Entity_GetColor.md) | Method | |
| [GetBounds](Entity_GetBounds.md) | Method |  |
| [GetDistance](Entity_GetDistance.md) | Method |  |
| [GetMass](Entity_GetMass.md) | Method |  |
| [GetParent](Entity_GetParent.md) | Method | |
| [GetPickMode](Entity_GetPickMode.md) | Method | |
| [GetPosition](Entity_GetPosition.md) | Method |  |
| [GetRotation](Entity_GetRotation.md) | Method | |
| [GetQuaternion](Entity_GetQuaternion.md) | Method | |
| [GetScale](Entity_GetScale.md) | Method | |
[3dkit] | [GetShadowMode](Entity_GetShadowMode.md) | Method |  |
| [GetVelocity](Entity_GetVelocity.md) | Method |  |
| [GetWorld](Entity_GetWorld.md) | Method | |
| [Hidden](Entity_Hidden.md) | Method | |
| [Hide](Entity_Hide.md) | Method |  |
| [Instantiate](Entity_Instantiate.md) | Method |  |
| [Move](Entity_Move.md) | Method | |
| [Pick](Entity_Pick.md) | Method | |
| [Point](Entity_Point.md) | Method | |
| [RecordCollisions](Entity_RecordCollisions.md) | Method | sets the recording mode for entity collision detection |
| [SetAngularVelocity](Entity_SetAngularVelocity.md) |Method |  |
| [SetCollider](Entity_SetCollider.md) | Method |  |
| [SetCollisionType](Entity_SetCollisionType.md) | Method | |
| [SetColor](Entity_SetColor.md) | Method | |
| [SetDamping](Entity_SetDamping.md) | Method | |
| [SetElasticity](Entity_SetElasticity.md) | Method | |
| [SetFriction](Entity_SetFriction.md) | Method | |
| [SetMass](Entity_SetMass.md) | Method | |
| [SetParent](Entity_SetParent.md) | Method | |
| [SetPickMode](Entity_SetPickMode.md) | Method | |
| [SetPosition](Entity_SetPosition.md) | Method | |
| [SetRenderLayer](Entity_SetRenderLayer.md) | Method | |
| [SetRotation](Entity_SetRotation.md) | Method | |
| [SetScale](Entity_SetScale.md) | Method | |
| [SetVelocity](Entity_SetVelocity.md) | Method | |
| [Show](Entity_Show.md) | Method | |
| [Sync](Entity_Sync.md) | Method | |
| [Translate](Entity_Translate.md) | Method | |
| [Turn](Entity_Turn.md) | Method | |
