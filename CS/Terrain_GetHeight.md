# Terrain.GetHeight

This method gets the height value at the specified coordinate.

## Syntax

- float **GetHeight**(int x, int y)
- float **GetHeight**([iVec2](iVec2.md) coord)

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coordinate |

## Returns

Returns the value stored in the heightmap at the specified coordinate.

### Example

```csharp
float height = Terrain.GetHeight(10, 5);
Console.WriteLine("Height at coordinate (10, 5): " + height);
```

```csharp
iVec2 coord = new iVec2(10, 5);
float height = Terrain.GetHeight(coord);
Console.WriteLine("Height at coordinate (10, 5): " + height);
```