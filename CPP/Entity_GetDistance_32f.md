# Entity::GetDistance

This method is used to calculate the distance in meters to another entity or to a point in global space.

## Syntax

- dFloat **GetDistance**(shared_ptr<[Entity](Entity_.md)\> entity)
- dFloat **GetDistance**(const dFloat x, const dFloat y, const dFloat z)
- dFloat **GetDistance**(shared_ptr<[xVec3](xVec3.md)\> point)

| Parameter | Description |
| --- | --- |
| entity | entity to return the distance to. |
| point | position in global space to return the distance to. |
| x | X component of the point to return the distance to. |
| y | Y component of the point to return the distance to. |
| z | Z component of the point to return the distance to. |

## Returns

Returns the distance to the specified entity or point, in meters.
