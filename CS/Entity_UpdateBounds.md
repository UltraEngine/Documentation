## Syntax

```csharp
void UpdateBounds(EntityBounds mode = BOUNDS_ALL)
```

| Parameter | Description |
|---|---|
| mode | bounds update mode, can be `BOUNDS_ALL` or any combination of `BOUNDS_LOCAL`, `BOUNDS_GLOBAL`, and `BOUNDS_RESURSIVE` |

## Example (C#)

```csharp
Entity entity = new Entity();
entity.UpdateBounds(EntityBounds.BOUNDS_ALL);
```

Please note that the example code is just a sample and may need modifications to fit into your specific implementation.