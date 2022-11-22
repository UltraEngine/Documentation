# Camera::Pick

This method performs a raycast at the specified screen coordinate.

## Syntax

- [PickInfo](PickInfo.md) Pick(shared_ptr<Framebuffer> framebuffer, const float x, const float y, const float radius = 0.0, const bool closest = false, const int collisiontype = COLLISION_NONE)
- [PickInfo](PickInfo.md) Pick(shared_ptr<Framebuffer> buffer, const Vec2& screencoord, const float radius = 0.0, const bool closest = false, const int collisiontype = 0)

| Parameter | Description |
| ----- | ----- |
| framebuffer | framebuffer to test with |
| screencoord, (x, y) | screen coordinate to pick |
| radius | pick sphere radius |
| closest | if true the closest point will be determined |
| collisiontype | optional collision type to test with |
  
## Returns
  
Returns a [PickInfo](PickInfo.md) structure. If the *success* member of the structure is true an object was hit, otherwise it will be false.
