# Scene

Base class: [Object](Object.md)

This class stores all the objects in a game level.

| Property | Type | Description |
|---|---|---|
| entities | vector< shared_ptr<[Entity](Entity.md)\> \> | array of all top-level entities in the map |
| [Reload](Map_Reload.md) | Method | reloads the map entity states from a file |
| [Save](Map_Save.md) | Method | saves the map to a file |
| [CreateMap](CreateMap.md) | Function | creates a new map object |
| [LoadMap](LoadMap.md) | Function | loads a map from a file |
