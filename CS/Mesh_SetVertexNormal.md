## Syntax

- void **SetVertexNormal**(int index, [Vec3](link) normal)
- void **SetVertexNormal**(int index, float x, float y, float z)

| Parameter | Description |
|---|---|
| index | vertex index, starting at zero |
| normal, (x, y, z) | vertex normal to set |

## Example

```csharp
// Example 1: Using Vec3 parameter
Vec3 normal = new Vec3(0.5f, 0.2f, 0.8f);
mesh.SetVertexNormal(3, normal);

// Example 2: Using individual float parameters
mesh.SetVertexNormal(5, 1.0f, -0.5f, 0.2f);
```