# Ray Casting #
Leadwerks 5 includes routines for performing ray intersection tests. You can call [World::Pick](API_World_Pick_FP.md) to
perform a ray cast on all entities in a world. You can perform per-entity ray casts with [Entity::Pick](API_Entity_Pick_FP.md).
You can also perform a ray cast on a single collider using the [Collider::Pick](API_Collider_Pick_FP.md) method. The [Camera::Pick](API_Camera_Pick_FP.md) method can be used to perform a world ray cast using screen coordinates.

## Classes ##

| Name | Description |
| ----- | ----- |
| [PickInfo](API_PickInfo_FP.md) | Contains information from the results of a ray cast test. |
