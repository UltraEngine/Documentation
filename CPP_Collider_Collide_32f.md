# Collider::Collide #
This method performs a static or swept collision test between two colliders.

## Syntax ##
- int **Collide**(shared_ptr<[Collider](API_Collider.md)\> collider, const [Mat4](API_Mat4.md)& mat0, const [Mat4](API_Mat4.md)& mat1, const float timestep, vector<[Collision](API_Collision_FP.md)\>& collisions)
- int **Collide**(shared_ptr<[Collider](API_Collider.md)\> collider, const [Mat4](API_Mat4.md)& mat0, const [Mat4](API_Mat4.md)& mat1, const [Vec3](API_Vec3.md)& velocity0, const [Vec3](API_Vec3.md)& velocity1, const [Vec3](API_Vec3.md)& omega0, const [Vec3](API_Vec3.md)& omega1, const float timestep, vector<[Collision](API_Collision_FP.md)\>& collisions)

| Parameter | Description | 
| ----- | ----- |
| collider | Collider to test collision against. |
| mat0 | 4x4 matrix of this collider. |
| mat1 | 4x4 matrix of the colliding collider. |
| velocity1 | Velocity of this collider. |

## Remarks ##
The time step tested will be one second. If the velocity of a collider is 10 meters per second, then the routine will consider the collider to have moved a distance of ten meters during the collision test.
