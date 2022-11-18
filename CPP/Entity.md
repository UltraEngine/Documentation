# Entity

Base class: [Object](Object.md)

This is the base class for all 3D objects in a world.

| Parameter | Type | Description |
|---|---|---|
| kids | vector<shared_ptr<[Entity](Entity.md)\> \> | read-only array of child entities |
| matrix | [Mat4](Mat4.md) | read-only 4x4 matrix |
| parent | shared_ptr<[Entity](Entity.md)\> | entity parent |
| position | [xVec3](xVec3.md) | read-only position |
| quaternion | [xQuat](xQuat.md) | read-only rotation |
| rotation | [xVec3](xVec3.md) | read-only Euler rotation |
| scale | [xVec3](xVec3.md) | read-only scale |
| [AddForce](Entity_AddForce.md) | Method | apply linear force to the entity |
| [AddPointForce](Entity_AddPointForce.md) | Method | apply linear force at a specific point |
| [AddTorque](Entity_AddTorque.md) | Method | apply torque to the entity |
| [AlignToVector](Entity_AlignToVector.md) | Method | aligns an axis to a vector |
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









