# World:GetTaggedEntities

This method retrieves all entities in the world with the specified tag.

## Syntax

- GetTaggedEntities(tag: [string](https://www.lua.org/manual/5.4/manual.html#6.4)): table

## Parameters

- `tag` ([string](https://www.lua.org/manual/5.4/manual.html#6.4)): Tag to search for.

## Returns

- (table): An array of all entities that use the specified tag.

## Remarks

You can set entity tags with the [`Entity:AddTag`](Entity_AddTag.md) method.
