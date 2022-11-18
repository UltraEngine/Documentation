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



