# CreateBoxBrush

This function creates a brush with a box shape.

## Syntax

- `Brush CreateBrush(World world)`
- `Brush CreateBrush(World world, float width, float height, float depth)`

| Parameter | Description |
|---|---|
| `world` | world to create the brush in |
| `width`, `height`, `depth` | dimensions of the box, in meters |

## Returns

Returns a new brush entity.

### Example

```csharp
Brush brush1 = CreateBrush(world);
Brush brush2 = CreateBrush(world, 2.0f, 1.0f, 3.0f);
```
