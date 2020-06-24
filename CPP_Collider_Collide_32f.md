# Collider::Collide #
This method performs a static or swept collision test between two colliders.

## Syntax ##
- int **Collide**(shared_ptr<Collider> collider, const Mat4& mat0, const Mat4& mat1, Vec3& point0, Vec3& point1, vector<[Collision](API_Collision_FP.md)\>& collisions = {})
- int **Collide**(shared_ptr<Collider> collider, const Mat4& mat0, const Mat4& mat1, const Vec3& velocity0, const Vec3& velocity1, const Vec3& omega0, const Vec3& omega1, Vec3& point0, Vec3& point1, vector<[Collision](API_Collision_FP.md)\>& collisions = {})

| Parameter | Description | 
| ----- | ----- |
| collider | Collider to test collision against. |
| mat0 | 4x4 matrix of this collider. |
| mat1 | 4x4 matrix of the colliding collider |
