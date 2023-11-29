# Mesh.GetVertexColor

This method returns the color of the specified mesh vertex.

## Syntax

```csharp
Vec4 GetVertexColor(uint index)
```

| Parameter | Description |
|---|---|
| index | vertex indice |

## Returns

Returns the vertex color.

## Example

```csharp
Vec4 color = mesh.GetVertexColor(0);
```