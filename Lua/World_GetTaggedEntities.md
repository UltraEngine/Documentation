# World:GetTaggedEntities

This method retrieves all entities in the world with the specified tag.

## Syntax

```lua
function World:GetTaggedEntities(tag: WString): table
```

## Parameters

- `tag` (WString): Tag to search for.

## Returns

- (table): An array of all entities that use the specified tag.

## Remarks

You can set entity tags with the [`Entity:AddTag`](Entity_AddTag.md) method.