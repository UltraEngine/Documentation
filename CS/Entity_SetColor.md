## Syntax

- void **SetColor**(Vec4 color, bool recursive = false)
- void **SetColor**(float r, float g, float b, float a = 1, bool recursive = false)
- void **SetColor**(float luminance, bool recursive = false)

| Parameter | Description |
| --- | --- |
| color | RGBA color to set |
| r | red component of the color to set |
| g | green component of the color to set |
| b | blue component of the color to set |
| a | alpha component of the color to set |
| luminance | RGB brightness to set |
| recursive | if set to true the entity subhierarchy will also be affected |

## Example

```csharp
// Set color using Vec4
Vec4 color = new Vec4(1, 0, 0, 1);
entity.SetColor(color);

// Set color using separate components
float r = 1;
float g = 0;
float b = 0;
float a = 1;
entity.SetColor(r, g, b, a);

// Set luminance
float luminance = 0.5;
entity.SetColor(luminance);
```