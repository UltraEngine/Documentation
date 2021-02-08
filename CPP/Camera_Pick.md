# Camera::Pick #

## Syntax ##

- bool Pick(shared_ptr<Framebuffer> buffer, const float x, const float y, PickInfo& pickinfo, const float radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)
- bool Pick(shared_ptr<Framebuffer> buffer, const Vec2& screencoord, PickInfo& pickinfo, const float radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)

| Parameter | Description |
| ----- | ----- |
| | |


## Example ##

