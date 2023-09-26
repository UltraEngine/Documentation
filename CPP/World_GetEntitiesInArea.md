# World::GetEntitiesInArea

This method efficiently retrieves all entities that intersect the specified bounding box.

## Syntax

vector<shared_ptr<[Entity](Entity.md)\> > **GetEntitiesInArea**(const [xVec3](xVec3.md)& minbounds, const [xVec3](xVec3.md)& maxbounds)

Parameter | Description
---|---
minbounds | lower bounds of area
maxbounds | upper bounds of area

## Returns

Returns all top-level entities that intersect the specified bounding box, or have entities in their sub-hierarchy that intersect the bounding box.
