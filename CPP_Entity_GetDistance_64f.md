# Entity::GetDistance #
This method is used to calculate the distance in meters to another entity or to a point in global space.

## Syntax ##

- double **GetDistance**(shared_ptr<[Entity](CPP_Entity_32f.md)\> entity)
- double **GetDistance**(shared_ptr<[dVec3](CPP_dVec3.md)\> point)

### Parameters ###

| Name | Description |
| --- | --- |
| entity | entity to return the distance to |
| point | position in global space to return the distance to |

# Returns #
Returns the distance to the specified entity or point, in meters.
