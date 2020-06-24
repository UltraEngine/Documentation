# Collider::ClosestPoint #
This method calculates the closest point between the collider and a position in 3D space, or the two closest points between two colliders.

## Syntax ##
- Vec3 **ClosestPoint**(const float x, const float y, const float z)
- Vec3 **ClosestPoint**(const Vec3& point)
- bool **ClosestPoint**(shared_ptr<Collider> collider, Mat4& mat0, Mat4& mat1, Vec3& point0, Vec3& point1)

## Returns ##
Returns the closest point to the specified position, or returns true if the two colliders intersect.
