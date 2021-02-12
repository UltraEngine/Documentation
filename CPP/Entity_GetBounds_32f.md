# Entity::GetBounds #
This method retrieves the entity bounding box.

## Syntax ##
- [AABB](AABB.md) **GetBounds**(const [EntityBounds](Constants.md) mode = BOUNDS_GLOBAL)

### Parameters ###
| Name | Description |
| --- | --- |
| mode | type of bounds to retrieve. This can be BOUNDS_LOCAL, BOUNDS_GLOBAL, or BOUNDS_RECURSIVE |

## Returns ##
Returns the specified entity bounding box.