# Entity

**Base class:** [Object](Object.md)

An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

## Members

| Name | Description |
|---|---|
| wstring **name** | name of the entity | 
| const [xVec3](xVec3.md)& **position** | read-only position in local space |
| const [xVec3](xVec3.md)& **rotation** | read-only Euler rotation in local space | 
| const [xQuat](xQuat.md)& **quaternion** | read-only rotation in local space |
| const [xVec3](xVec3.md)& **scale** | read-only scale |
| const [xMat4](xMat4.md)& **matrix** | read-only 4x4 matrix |
| const [Vec4](Vec4.md)& **color** | read-only object color |
| vector<shared_ptr<[Entity](Entity.md)\> \>& **kids** | read-only array of child entities |

## Methods

| Name | Description |
|---|---|
| [AddActor](Entity_AddActor.md) | Adds an actor to the entity. |
| [AddForce](Entity_AddForce_32f.md) | Applies a force, measured in Newtons, to an entity at a specified point. This can result in both movement and rotation of the entity. |
| [AddPointForce](Entity_AddPointForce_32f.md) | |
| [AddScript](Entity_AddScript.md) | |
| [AddTorque](Entity_AddTorque_32f.md) | |
| [AlignToVector](Entity_AlignToVector_32f.md) | |
| [Attach](Entity_Attach.md) | |
| [Copy](Entity_Copy.md) | |
| [Detach](Entity_Detach.md) | |
| [FindChild](Entity_FindChild.md) | |
| [GetCollision](Entity_GetCollision.md) | |
| [GetCollisionType](Entity_GetCollisionType.md) | |
| [GetColor](Entity_GetColor.md) | |
| [GetBounds](Entity_GetBounds_32f.md) | |
| [GetDistance](Entity_GetDistance_32f.md) | |
| [GetMass](Entity_GetMass_32f.md) | |
| [GetAngularVelocity](Entity_GetOmega_32f.md) | |
| [GetEmission](GetEmission.md) | |
| [GetParent](Entity_GetParent.md) | |
| [GetPickMode](Entity_GetPickMode.md) | |
| [GetPosition](Entity_GetPosition_32f.md) | |
| [GetRotation](Entity_GetRotation_32f.md) | |
| [GetQuaternion](Entity_GetQuaternion_32f.md) | |
| [GetScale](Entity_GetScale_32f.md) | |
| [GetShadowMode](Entity_GetShadowMode.md) | |
| [GetVelocity](Entity_GetVelocity_32f.md) | |
| [GetWorld](Entity_GetWorld.md) | |
| [Hide](Entity_Hide.md) | |
| [Hidden](Entity_Hidden.md) | |
| [Instantiate](Entity_Instantiate.md) | |
| [MakeStatic](Entity_MakeStatic.md) | |
| [Move](Entity_Move_32f.md) | |
| [Pick](Entity_Pick_32f.md) | |
| [Point](Entity_Point_32f.md) | |
| [Reset](Entity_Reset.md) | |
| [SetCollision](Entity_SetCollision.md) | |
| [SetCollisionType](Entity_SetCollisionType.md) | |
| [SetColor](Entity_SetColor.md) | |
| [SetMass](Entity_SetMass.md) | |
| [SetAngularVelocity](Entity_SetOmega_32f.md) | |
| [SetEmission](SetEmission.md) | |
| [SetParent](Entity_SetParent.md) | |
| [SetPickMode](Entity_SetPickMode.md) | |
| [SetPosition](Entity_SetPosition_32f.md) | |
| [SetRotation](Entity_SetRotation_32f.md) | |
| [SetScale](Entity_SetScale_32f.md) | |
| [SetShadowMode](Entity_SetShadowMode.md) | |
| [SetVelocity](Entity_SetVelocity_32f.md) | |
| [Show](Entity_Show.md) | |
| [Translate](Entity_Translate_32f.md) | |
| [Turn](Entity_Turn_32f.md) | |
