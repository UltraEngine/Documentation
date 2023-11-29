# Mesh.Translate

This method translates all vertex positions by the specified offset.

## Syntax 

- void **Translate**(float x, float y, float z)
- void **Translate**(Vec3 offset)

| Parameter | Description |
|---|---|
| offset, (x, y, z) | offset to translate mesh vertices by |

### Example

```csharp
Mesh mesh = new Mesh();
Vec3 offset = new Vec3(1.0f, 2.0f, 3.0f);
mesh.Translate(offset);
```