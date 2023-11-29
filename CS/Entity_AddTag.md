# Entity.AddTag

This method adds a text tag to the entity.

## Syntax

```csharp
void AddTag(string tag)
```

## Remarks

You can use [World.GetTaggedEntities](World_GetTaggedEntities.md) to retrieve all entities that use a specific tag.

## Example

```csharp
entity.AddTag("player");
```