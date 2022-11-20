# World::GetTaggedEntities

This method retrieves all entities in the world with the specified tag.

## Syntax

- vector<shared_ptr<[Entity](Entity.md)\> \> **GetTaggedEntities**(const [WString](WString.md)& tag)

| Parameter | Description |
|---|---|
| tag | tag to search for |

## Returns

Returns an array of all entities that use the specified tag.

## Remarks

You can set entity tags with the [Entity::AddTag](Entity_AddTag.md) method.
