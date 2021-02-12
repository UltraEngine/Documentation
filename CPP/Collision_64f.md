# Collision #
This class stores collision information.

| Property | Type | Description |
| ----- | ----- | ----- |
| position | [dVec3](dVec3.md) | Position in global space where collision occured. |
| normal | [dVec3](dVec3.md) | Normal of the collision impact, in global space. |
| penetration | double | Amount of collision penetration. |
| polygon | array<int, 2> | Polygon index, for mesh collisions only. |
| time | double | Time interval at which the collision occured. |