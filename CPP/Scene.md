# Scene

Base class: [Object](Object.md)

The scene class stores all the objects in a game level.

| Property | Type | Description |
|---|---|---|
| entities | vector< shared_ptr<[Entity](Entity.md)\> \> | array of all top-level entities in the scene |
| [Reload](Scene_Reload.md) | Method | reloads the scene entity states from a file |
| [Save](Scene_Save.md) | Method | saves the scene to a file |
| [CreateScene](CreateScene.md) | Function | creates a new scene object |
| [LoadScene](LoadScene.md) | Function | loads a scene file |
