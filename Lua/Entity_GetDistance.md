# Entity::GetDistance

This method is used to calculate the distance in meters to another entity or to a point in global space.

## Syntax

- number **GetDistance**([Entity](Entity.md) entity)
- number **GetDistance**([xVec3](xVec3.md) point)
- number **GetDistance**(number x, number y, number z)

| Parameter | Description |
| --- | --- |
| entity | entity to return the distance to. |
| point, (x, y, z) | position in global space to return the distance to |

## Returns

Returns the distance to the specified entity or point, in meters.
