## Syntax

```csharp
void SetVertexPosition(int v, float x, float y, float z);
void SetVertexPosition(int v, Vec3 position);
```

| Parameter | Description |
|---|---|
| v | vertex index to set |
| position, (x, y, z) | position to set |

## Example

```csharp
// Example usage of SetVertexPosition

// Set vertex position by providing individual coordinates
SetVertexPosition(0, 1.0f, 2.0f, 3.0f);

// Set vertex position using a Vec3 object
Vec3 position = new Vec3(4.0f, 5.0f, 6.0f);
SetVertexPosition(1, position);
```

Note: You may need to import the appropriate namespace for the `Vec3` type.