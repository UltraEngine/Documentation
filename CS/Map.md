# Map

Base class: [Object](Object.md)

This class stores all the objects in a game level.

| Property | Type | Description |
|---|---|---|
| entities | List< [Entity](Entity.md) > | array of all top-level entities in the map |
| [Reload](Map_Reload.md) | Method | reloads the map entity states from a file |
| [Save](Map_Save.md) | Method | saves the map to a file |
| [CreateMap](CreateMap.md) | Function | creates a new map object |
| [LoadMap](LoadMap.md) | Function | loads a map from a file |

## Example

```csharp
using System.Collections.Generic;

public class Map : Object
{
    public List<Entity> entities;

    public void Reload()
    {
        // reloads the map entity states from a file
    }

    public void Save()
    {
        // saves the map to a file
    }

    public static Map CreateMap()
    {
        // creates a new map object
        return new Map();
    }

    public static Map LoadMap(string file)
    {
        // loads a map from a file
        return new Map();
    }
}
```