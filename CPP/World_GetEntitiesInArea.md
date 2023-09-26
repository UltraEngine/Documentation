# World::GetEntitiesInArea

This method efficiently retrieves all entities that intersect the specified bounding box.

## Syntax

vector<shared_ptr<[Entity](Entity.md)\> > **GetEntitiesInArea**(const [xVec3](xVec3.md)& minbounds, const [xVec3](xVec3.md)& maxbounds)

| Paraemter | Description |
|---|---|
| area | bounding box to test for intersecting entities |

## Returns

Returns all top-level entities that intersect the specified bounding box, or have entities in their sub-hierarchy that intersect the bounding box.
