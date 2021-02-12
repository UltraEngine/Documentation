# Collider::Collide #
This method performs a static or swept collision test between two colliders.

## Syntax ##
- int **Collide**(shared_ptr<[Collider](Collider.md)\> collider, const [Mat4](Mat4.md)& mat0, const [Mat4](Mat4.md)& mat1, const float timestep, vector<[Collision](Collision_FP.md)\>& collisions)
- int **Collide**(shared_ptr<[Collider](Collider.md)\> collider, const [Mat4](Mat4.md)& mat0, const [Mat4](Mat4.md)& mat1, const [Vec3](Vec3.md)& velocity0, const [Vec3](Vec3.md)& velocity1, const [Vec3](Vec3.md)& omega0, const [Vec3](Vec3.md)& omega1, const float timestep, vector<[Collision](Collision_FP.md)\>& collisions)

| Parameter | Description | 
| ----- | ----- |
| collider | Collider to test collision against. |
| mat0 | 4x4 matrix of this collider. |
| mat1 | 4x4 matrix of the colliding collider. |
| velocity0 | Velocity of this collider. |
| omega0 | Angular velocity of this collider. |
| timestep | Time elapsed in milliseconds. This is usually equal to 1.0 / 60.0. |
| collisions | Array of [Collision](Collision_FP.md) objects for recording information. |