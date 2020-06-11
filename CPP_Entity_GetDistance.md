# Entity::GetDistance #
This method is used to calculate the distance in meters to another entity or to a point in global space.

## Syntax ##

- dFloat **GetDistance**(shared_ptr<[Entity](CPP_Entity.md)\> entity)
- dFloat **GetDistance**(shared_ptr<[Vec3](CPP_Vec3.md)\> point)
- dFloat **GetDistance**(shared_ptr<[dVec3](CPP_dVec3.md)\> point)

### Parameters ###

| Name | Description |
| --- | --- |
| entity | entity to return the distance to |
| point | position in global space to return the distance to |

# Returns #
Returns the distance to the specified entity or point, in meters.
