# World:GetEntitiesInArea

This method efficiently retrieves all entities that intersect the specified bounding box.

## Syntax

`World:GetEntitiesInArea(area)`

## Parameters

* `area` (xAabb): bounding box to test for intersecting entities

## Returns

* `entities` (table): All top-level entities that intersect the specified bounding box, or have entities in their sub-hierarchy that intersect the bounding box.

## Example

```lua
local entities = World:GetEntitiesInArea(area)

for i, entity in ipairs(entities) do
    -- Do something with the entity
end
```