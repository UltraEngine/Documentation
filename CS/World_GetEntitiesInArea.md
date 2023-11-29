# World.GetEntitiesInArea

This method efficiently retrieves all entities that intersect the specified bounding box.

## Syntax

```csharp
List<Entity> GetEntitiesInArea(xVec3 minbounds, xVec3 maxbounds)
```

Parameter | Description
---|---
minbounds | lower bounds of area
maxbounds | upper bounds of area

## Returns

Returns all top-level entities that intersect the specified bounding box, or have entities in their sub-hierarchy that intersect the bounding box.

Example:

```csharp
List<Entity> entities = World.GetEntitiesInArea(minbounds, maxbounds);
```