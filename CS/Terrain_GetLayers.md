## Syntax

```csharp
List<int> GetLayers(int x, int y);
List<int> GetLayers(iVec2 coord);
```

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coordinate |

## Returns

Returns a list containing all the layer indexes in use at the specified point, sorted from most to least influential.

## Example

```csharp
List<int> layers = GetLayers(10, 20);
foreach(int layer in layers)
{
    Console.WriteLine(layer);
}

// Or

iVec2 coord = new iVec2(10, 20);
List<int> layers = GetLayers(coord);
foreach(int layer in layers)
{
    Console.WriteLine(layer);
}
```