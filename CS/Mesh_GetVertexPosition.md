# Mesh.GetVertexPosition

This method gets the position of the specified vertex.

## Syntax

- [Vector3](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector3) **GetVertexPosition**(uint index)

| Parameter | Description |
|-|-|
| index | vertex index |

## Returns

Returns the vertex position.

### Example

```csharp
Vector3 vertexPosition = mesh.GetVertexPosition(0);
```