# Entity

Base class: [Object](Object.md)

This is the base class for all 3D objects in a world.

| Parameter | Type | Description |
|---|---|---|
| extra | shared_ptr<[Object](Object.md)\> | user-defined object |
| kids | vector<shared_ptr<[Entity](Entity.md)\> \> | read-only array of child entities |
| matrix | [xMat4](xMat4.md) | read-only 4x4 matrix |
| name | [WString](WString.md) | entity name |
| parent | shared_ptr<[Entity](Entity.md)\> | entity parent |
| position | [xVec3](xVec3.md) | read-only position |
| quaternion | [xQuat](xQuat.md) | read-only rotation |
| rotation | [xVec3](xVec3.md) | read-only Euler rotation |
| scale | [xVec3](xVec3.md) | read-only scale |
| tags | set<[WString](WString.md)\> | read-only container of tags |
| [AddTag](Entity_AddTag.md) | Method | adds a tag |
| [AddForce](Entity_AddForce.md) | Method | apply linear force to the entity |
| [AddPointForce](Entity_AddPointForce.md) | Method | apply linear force at a specific point |
| [AddTorque](Entity_AddTorque.md) | Method | apply torque to the entity |
| [AlignToVector](Entity_AlignToVector.md) | Method | aligns an axis to a vector |
| [ClearTags](Entity_ClearTags.md) | Method | removes all tags |
| [Copy](Entity_Copy.md) | Method | duplicates the entity |
| [FindChild](Entity_FindChild.md) | Method | searches for a child by name |
| [GetAngularVelocity](Entity_GetAngularVelocity.md) | Method | returns the entity angular velocity |
| [GetCollider](Entity_GetCollider.md) | Method | returns the physics collider |
| [GetCollisionType](Entity_GetCollisionType.md) | Method | returns the collision type |
| [GetColor](Entity_GetColor.md) | Method | returns the entity color |
| [GetBounds](Entity_GetBounds.md) | Method | returns an axis-aligned bounding box |
| [GetDistance](Entity_GetDistance.md) | Method | calculates distance to another entity |
| [GetHidden](Entity_GetHidden.md) | Method | returns the entity hide state |
| [GetMass](Entity_GetMass.md) | Method | returns the entity mass |
| [GetParent](Entity_GetParent.md) | Method | returns the parent entity |
| [GetPickMode](Entity_GetPickMode.md) | Method | returns the entity pick mode |
| [GetPosition](Entity_GetPosition.md) | Method | returns the entity position |
| [GetRotation](Entity_GetRotation.md) | Method | returns the entity Euler rotation |
| [GetQuaternion](Entity_GetQuaternion.md) | Method | returns the entity rotation |
| [GetScale](Entity_GetScale.md) | Method | returns the entity scale |
| [GetVelocity](Entity_GetVelocity.md) | Method | returns the entity linear velocity |
| [GetWorld](Entity_GetWorld.md) | Method | returns the world the entity resides in |
| [Instantiate](Entity_Instantiate.md) | Method | creates an instanced copy of the entity |
| [Move](Entity_Move.md) | Method | moves the entity |
| [Point](Entity_Point.md) | Method | points one entity at another |
| [RecordCollisions](Entity_RecordCollisions.md) | Method | enables collision recording |
| [RemoveTag](Entity_RemoveTag.md) | Method | removes a tag |
| [SetAngularVelocity](Entity_SetAngularVelocity.md) | Method |sets the entity angular velcoty |
| [SetCollider](Entity_SetCollider.md) | Method | sets the entity physics collider |
| [SetCollisionType](Entity_SetCollisionType.md) | Method | sets the entity collision type |
| [SetColor](Entity_SetColor.md) | Method | sets the entity color |
| [SetDamping](Entity_SetDamping.md) | Method | sets the entity physics damping |
| [SetElasticity](Entity_SetElasticity.md) | Method | sets the entity physics elasticity |
| [SetFriction](Entity_SetFriction.md) | Method | sets the entity physics friction |
| [SetHidden](Entity_SetHidden.md) | Method | hides or shows the entity |
| [SetMass](Entity_SetMass.md) | Method | sets the entity physical mass |
| [SetMaterial](Entity_SetMaterial.md) | Method | applies a material to the entity |
| [SetParent](Entity_SetParent.md) | Method | parents one entity to another |
| [SetPosition](Entity_SetPosition.md) | Method | sets the entity position in local or global space |
| [SetRotation](Entity_SetRotation.md) | Method | sets the entity rotation in local or global space |
| [SetScale](Entity_SetScale.md) | Method | sets the entity scale |
| [SetVelocity](Entity_SetVelocity.md) | Method | sets the entity linear velocity |
| [Sync](Entity_Sync.md) | Method | resets rendering interpolation |
| [Translate](Entity_Translate.md) | Method | translates the entity position in local or global space |
| [Turn](Entity_Turn.md) | Method | turns the entity in local or global space |


















