# Entity

An entity is the base class for all "things" in 3D space. A light is an entity. So is a model. An entity has a position, rotation, and scale. It can be parented to other entities, or be the parent of a child entity. Because all entity classes like models, lights, cameras, etc., are extended from the base entity class, the same positioning and rotation commands below can be used on all 3D objects in the engine.

**Base class:** [Object](Object.md)


| Property | Type | Description |
|---|---|---|
| color | const [Vec4](Vec4.md)& | read-only object color |
| kids | const vector<shared_ptr<[Entity](Entity.md)\> \>& | read-only array of child entities |
| name | [WString](WString.md) | name of the entity | 
| matrix | const [xMat4](xMat4.md)& | read-only 4x4 matrix |
| position | const [xVec3](xVec3.md)& | read-only position in local space |
| rotation | const [xVec3](xVec3.md)& | read-only Euler rotation in local space | 
| quaternion | const [xQuat](xQuat.md)& | read-only rotation in local space |
| scale | const [xVec3](xVec3.md)& | read-only scale |
| [AddForce](Entity_AddForce.md) | Method | applies a force |
| [AddPointForce](Entity_AddPointForce.md) | Method | apply force at a position |
| [AddComponent](Entity_AddComponent.md) | Method | add a script component |
| [AddTorque](Entity_AddTorque.md) | Method | apply torque |
| [AlignToVector](Entity_AlignToVector.md) | Method | align the entity to an axis |
| [BuildShape](Entity_BuildShape.md) | Method | creates a collider for the entity |
| [Copy](Entity_Copy.md) | Method | make a copy of the entity |
| [FindChild](Entity_FindChild.md) | Method | search for one or multiple children |
| [GetAngularVelocity](Entity_GetAngularVelocity.md) | Method | retrieves the angular velocity |
| [GetCollider](Entity_GetCollider.md) | Method | retrieves the physics collider |
| [GetCollisionType](Entity_GetCollisionType.md) | Method | retrieves the collision type |
| [GetColor](Entity_GetColor.md) | Method | retrieves the color |
| [GetBounds](Entity_GetBounds.md) | Method | retrieves the bounding box |
| [GetDistance](Entity_GetDistance.md) | Method | calculates the distance to a point or entity |
| [GetHidden](Entity_GetHidden.md) | Method | retrieves the hide state |
| [GetMass](Entity_GetMass.md) | Method | retrieves the mass |
| [GetParent](Entity_GetParent.md) | Method | retrieves the parent entity |
| [GetPickMode](Entity_GetPickMode.md) | Method | retrieves the pick mode |
| [GetPosition](Entity_GetPosition.md) | Method | retrieves the local or global position |
| [GetRotation](Entity_GetRotation.md) | Method | retrieves the local or global rotation |
| [GetQuaternion](Entity_GetQuaternion.md) | Method | retrieves the local or global rotation |
| [GetScale](Entity_GetScale.md) | Method | retrieves the scale |
| [GetShadowMode](Entity_GetShadowMode.md) | Method | retrieves the scale mode |
| [GetVelocity](Entity_GetVelocity.md) | Method | retrieves the velocity |
| [GetWorld](Entity_GetWorld.md) | Method | retrieves the entity's world |
| [Instantiate](Entity_Instantiate.md) | Method | creates an instance of the entity |
| [Move](Entity_Move.md) | Method | moves the entity |
| [Pick](Entity_Pick.md) | Method | performs a raycast |
| [Point](Entity_Point.md) | Method | points the entity at a position or entity |
| [RecordCollisions](Entity_RecordCollisions.md) | Method | sets the recording mode for entity collision detection |
| [SetAngularVelocity](Entity_SetAngularVelocity.md) | Method | sets the angular velocity |
| [SetCollider](Entity_SetCollider.md) | Method | specifies a physics collider to use |
| [SetCollisionType](Entity_SetCollisionType.md) | Method | sets the collision type |
| [SetColor](Entity_SetColor.md) | Method | sets the color |
| [SetDamping](Entity_SetDamping.md) | Method | sets the damping values |
| [SetElasticity](Entity_SetElasticity.md) | Method | sets the elasticity |
| [SetFriction](Entity_SetFriction.md) | Method | sets the friction |
| [SetHidden](Entity_SetHidden.md) | Method | sets the hide state |
| [SetMass](Entity_SetMass.md) | Method | sets the mass |
| [SetParent](Entity_SetParent.md) | Method | parents the entity to another one |
| [SetPickMode](Entity_SetPickMode.md) | Method | sets the pick mode |
| [SetPosition](Entity_SetPosition.md) | Method | positions the entity in local or global space |
| [SetRenderLayer](Entity_SetRenderLayer.md) | Method | sets the render layer |
| [SetRotation](Entity_SetRotation.md) | Method | rotates the entity in local or global space |
| [SetScale](Entity_SetScale.md) | Method | scales the entity |
| [SetVelocity](Entity_SetVelocity.md) | Method | sets the velocity |
| [Sync](Entity_Sync.md) | Method | resets entity rendering interpolation |
| [Translate](Entity_Translate.md) | Method | translates the entity in parent or global space |
| [Turn](Entity_Turn.md) | Method | turns the entity in local or global space |
