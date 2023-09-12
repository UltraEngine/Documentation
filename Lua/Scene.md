# Scene

Base class: [Object](Object.md)

The scene class stores all the objects in a game level.

| Property | Type | Description |
|---|---|---|
| entities | table | array of all top-level entities in the scene |
| [Reload](#reload) | Function | reloads the scene entity states from a file |
| [Save](#save) | Function | saves the scene to a file |
| [CreateScene](#createscene) | Function | creates a new scene object |
| [LoadScene](#loadscene) | Function | loads a scene file |

## Reload
```lua
function Reload()
  -- reloads the scene entity states from a file
end
```

## Save
```lua
function Save()
  -- saves the scene to a file
end
```

## CreateScene
```lua
function CreateScene()
  -- creates a new scene object
end
```

## LoadScene
```lua
function LoadScene()
  -- loads a scene file
end
```