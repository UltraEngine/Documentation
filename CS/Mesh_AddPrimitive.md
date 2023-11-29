# Mesh.AddPrimitive

This method adds a single line, triangle, or quad to the mesh.

## Syntax

- int **AddPrimitive**(uint a, uint b)
- int **AddPrimitive**(uint a, uint b, uint c)
- int **AddPrimitive**(uint a, uint b, uint c, uint d)

| Parameter | Description |
|---|---|
| a, b, c, d | vertex indices |

## Returns

Returns the index of the new primitive.

## Remarks

The number of arguments must match the mesh primitive type.

## Example

```csharp
// Add a line to the mesh
int lineIndex = mesh.AddPrimitive(0, 1);

// Add a triangle to the mesh
int triangleIndex = mesh.AddPrimitive(0, 1, 2);

// Add a quad to the mesh
int quadIndex = mesh.AddPrimitive(0, 1, 2, 3);
```