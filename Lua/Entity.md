# Entity

Base class: [Object](Object.md)

This class serves as the foundation for all 3D objects in a world. It provides a common set of properties and methods that are shared by all 3D objects, including terrain, lights, 3D models, and other types of objects.

| Property | Type | Description |
|---|---|---|
| extra | shared_ptr<[Object](Object.md)\> | user-defined object |
| kids | const table | read-only array of child entities |
| matrix | const xMat4 | read-only 4x4 matrix |
| name | string | entity name |
| omega | const xVec3 | read-only angular velocity |
| parent | const shared_ptr<[Entity](Entity.md)\> | entity parent |
| position | const xVec3 | read-only position |
| properties | table | user-defined properties |
| quaternion | const xQuat | read-only rotation |
| rotation | const xVec3 | read-only Euler rotation |
| scale | const xVec3 | read-only scale |
| tags | const table | read-only container of tags |
| velocity | const xVec3 | read-only linear velocity |
| AddComponent | Method | adds an entity component |
| AddForce | Method | apply linear force to the entity |
| AddPointForce | Method | apply linear force at a specific point |
| AddTag | Method | adds a tag |
| AddTorque | Method | apply torque to the entity |
| AlignToVector | Method | aligns an axis to a vector |
| Attach | Method | attaches the entity to a bone or navigation agent |
| ClearTags | Method | removes all tags |
| Copy | Method | duplicates the entity |
| FindChild | Method | searches for a child by name |
| GetAirborne | Method | returns the airborne state of a player |
| GetAngularVelocity | Method | returns the entity angular velocity |
| GetCollider | Method | returns the physics collider |
| GetComponent | Method | gets an entity component |
| GetCollisionType | Method | returns the collision type |
| GetColor | Method | returns the entity color |
| GetCrouched | Method | returns the crouched state of a player |
| GetBounds | Method | returns an axis-aligned bounding box |
| GetDistance | Method | calculates distance to another entity |
| GetHidden | Method | returns the entity hide state |
| GetMass | Method | returns the entity mass |
| GetParent | Method | returns the parent entity |
| GetPhysicsMode | Method | gets the entity physics behavior |
| GetPickMode | Method | returns the entity pick mode |
| GetPosition | Method | returns the entity position |
| GetRotation | Method | returns the entity Euler rotation |
| GetQuaternion | Method | returns the entity rotation |
| GetScale | Method | returns the entity scale |
| GetUuid | Method | returns the entity's unique identifier |
| GetVelocity | Method | returns the entity linear velocity |
| GetWorld | Method | returns the world the entity resides in |
| Instantiate | Method | creates an instanced copy of the entity |
| Listen | Method | uses the entity for sound spatialization |
| Move | Method | moves the entity |
| Point | Method | points one entity at another |
| RecordCollisions | Method | enables collision recording |
| RemoveTag | Method | removes a tag |
| SetAngularVelocity | Method | sets the entity angular velocity |
| SetCollider | Method | sets the entity physics collider |
| SetCollisionType | Method | sets the entity collision type |
| SetColor | Method | sets the entity color |
| SetDamping | Method | sets the entity physics damping |
| SetElasticity | Method | sets the entity physics elasticity |
| SetFriction | Method | sets the entity physics friction |
| SetFog | Method | controls whether distance fog affects the entity |
| SetHidden | Method | hides or shows the entity |
| SetInput | Method | handles controls for player movement |
| SetMass | Method | sets the entity physical mass |
| SetMaterial | Method | applies a material to the entity |
| SetParent | Method | parents one entity to another |
| SetPhysicsMode | Method | sets the entity physics behavior |
| SetPosition | Method | sets the entity position in local or global space |
| SetRotation | Method | sets the entity rotation in local or global space |
| SetScale | Method | sets the entity scale |
| SetVelocity | Method | sets the entity linear velocity |
| Staticize | Method | permanently makes an entity static |
| Sync | Method | resets rendering interpolation |
| Translate | Method | translates the entity position in local or global space |
| Turn | Method | turns the entity in local or global space |
| UpdateBounds | Method | updates the entity bounding boxes |