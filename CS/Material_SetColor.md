# Material.SetColor

This method sets the material color.

## Syntax

- void **SetColor**(Vec4 color)
- void **SetColor**(float r, float g, float b, float a = 1)

| Parameter | Description |
|---|---|
| color, (r, g, b, a) | color to set |

## Example

### Example 1

```csharp
Vec4 color = new Vec4(0.5f, 0.2f, 0.8f, 1.0f);
material.SetColor(color);
```

### Example 2

```csharp
float r = 0.5f;
float g = 0.2f;
float b = 0.8f;
float a = 1.0f;
material.SetColor(r, g, b, a);
```