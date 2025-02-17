# Scene

Base class: [Object](Object.md)

This class stores all the objects in a game level.

| Property | Type | Description |
|---|---|---|
| entities | [table](https://www.lua.org/manual/5.4/manual.html#6.6) | array of all top-level entities in the map |
| path | string | file path |
| [Reload](Scene_Reload.md) | Method | reloads the map entity states from a file |
| [Save](Scene_Save.md) | Method | saves the map to a file |
| [CreateScene](CreateScene.md) | Function | creates a new map object |
| [LoadScene](LoadScene.md) | Function | loads a map from a file |
