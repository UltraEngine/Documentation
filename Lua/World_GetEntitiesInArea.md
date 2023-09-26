# World:GetEntitiesInArea

This method efficiently retrieves all entities that intersect the specified bounding box.

## Syntax

- [table](https://www.lua.org/manual/5.4/manual.html#6.6) **GetEntitiesInArea**([xAabb](xAabb.md) area)

## Parameters

Parameter | Description
---|---
area | bounding box to test for intersecting entities

## Returns

Returns an array of all top-level entities that intersect the specified bounding box, or have entities in their sub-hierarchy that intersect the bounding box.
