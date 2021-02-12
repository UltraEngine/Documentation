# Collider::Pick #
This method performs a ray intersection test on the collider.

## Syntax ##
- bool **Pick**(const [Vec3](Vec3.md)& p0, const [Vec3](Vec3.md)& p1, [PickInfo](PickInfo_FP.md)& pickinfo)

| Parameter | Description |
| ---- | ---- |
| p0 | Starting point of the ray. |
| p1 | End point of the ray. |
| pickinfo | Structure to store information about the results. |

## Returns ##
Returns true if the ray intersects the collider, otherwise false is returned.