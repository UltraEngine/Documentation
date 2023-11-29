# CreatePlane

This function creates a new model consisting of a single rectangle.

## Syntax

- [Model](Model.md) **CreatePlane**([World](World.md) world, float width = 1, float height = 1, int xsegs = 1, int ysegs = 1, [MeshPrimtives](MeshPrimtives.md) type = MESH_TRIANGLES)

| Parameter | Description |
|---|---|
| world | world to create the model in |
| width, height | plane dimensions |
| xsegs, ysegs | mesh subdivision |
| type | can be MESH_TRIANGLES or MESH_QUADS |

## Returns

Returns a new model.

```csharp
Model CreatePlane(World world, float width = 1, float height = 1, int xsegs = 1, int ysegs = 1, MeshPrimtives type = MESH_TRIANGLES)
{
    // code to create a new model
}
```