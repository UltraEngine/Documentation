## Syntax

- void **SetVertexPosition**(uint index, [Vec3](Vec3.md) position)
- void **SetVertexPosition**(uint index, float x, float y, float z)

| Parameter | Description |
|---|---|
| index | vertex index, starting with zero |
| position, (x, y, z) | vertex position to set |


example in C#: 
```csharp
// Set the position using a Vec3 object
Vec3 position = new Vec3(x, y, z);
SetVertexPosition(index, position);

// Set the position using individual floats
SetVertexPosition(index, x, y, z);
```