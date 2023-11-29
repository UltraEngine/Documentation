# Entity.GetBounds

This method retrieves the entity bounding box.

## Syntax

```csharp
public XAabb GetBounds(EntityBounds mode = EntityBounds.BOUNDS_GLOBAL)
```

| Parameter | Description |
| --- | --- |
| mode | type of bounds to retrieve, can be EntityBounds.BOUNDS_LOCAL, EntityBounds.BOUNDS_GLOBAL, or EntityBounds.BOUNDS_RECURSIVE |

## Returns

Returns the specified entity bounding box.