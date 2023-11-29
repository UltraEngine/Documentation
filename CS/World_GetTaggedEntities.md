# World.GetTaggedEntities

This method retrieves all entities in the world with the specified tag.

## Syntax

```csharp
Entity[] GetTaggedEntities(string tag)
```

| Parameter | Description |
|---|---|
| tag | tag to search for |

## Returns

Returns an array of all entities that use the specified tag.

## Remarks

You can set entity tags with the [Entity.AddTag](Entity_AddTag.md) method.

Example:

```csharp
string tag = "player";
Entity[] taggedEntities = world.GetTaggedEntities(tag);
```