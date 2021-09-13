# Entity::GetDistance

This method is used to calculate the distance in meters to another entity or to a point in global space.

## Syntax

- dFloat **GetDistance**(shared_ptr<[Entity](Entity.md)\> entity)
- dFloat **GetDistance**(shared_ptr<[xVec3](xVec3.md)\> point)
- dFloat **GetDistance**(const dFloat x, const dFloat y, const dFloat z)

| Parameter | Description |
| --- | --- |
| entity | entity to return the distance to. |
| point, (x, y, z) | position in global space to return the distance to |

## Returns

Returns the distance to the specified entity or point, in meters.
