# Collision #
This class stores collision information.

| Property | Type | Description |
| ----- | ----- | ----- |
| position | [Vec3](Vec3.md) | Position in global space where collision occured. |
| normal | [Vec3](Vec3.md) | Normal of the collision impact, in global space. |
| penetration | float | Amount of collision penetration. |
| polygon | array<int, 2> | Polygon index, for mesh collisions only. |
| time | float | Time interval at which the collision occured. |