# Entity::GetDistance #
This method is used to calculate the distance in meters to another entity or to a point in global space.

## Syntax ##

- double **GetDistance**(shared_ptr<[Entity](CPP_Entity_32f.md)\> entity)
- double **GetDistance**(const double x, const double y, const double z)
- double **GetDistance**(shared_ptr<[dVec3](CPP_dVec3.md)\> point)

### Parameters ###

| Name | Description |
| --- | --- |
| entity | entity to return the distance to |
| x | X component of the point to return the distance to. |
| y | Y component of the point to return the distance to. |
| z | Z component of the point to return the distance to. |
| point | position in global space to return the distance to |

# Returns #
Returns the distance to the specified entity or point, in meters.
