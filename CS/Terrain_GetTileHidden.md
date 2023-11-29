# Terrain.GetTileHidden

This method is used to check if a single terrain tile is visible.

## Syntax

- bool **GetTileHidden**(int x, int y)
- bool **GetTileHidden**([iVec2](iVec2) coord)

| Parameter | Description |
|---|---|
| coord, (x, y) | tile coordinate |

## Returns

Returns true if the file is hidden, otherwise false is returned.

## Example

```csharp
// Example usage of the GetTileHidden method

// Create an instance of the Terrain class
Terrain terrain = new Terrain();

// Check if tile at coordinate (2, 3) is hidden
bool tileHidden = terrain.GetTileHidden(2, 3);

// Print the result
Console.WriteLine("Is tile hidden? " + tileHidden);
```

Note: In the example code above, the `Terrain` class is assumed to be properly instantiated and accessible.