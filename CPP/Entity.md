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


