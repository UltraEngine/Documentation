#LoadPostEffect

This function loads a post-processing effect from a JSON file.

## Syntax

```lua
function LoadPostEffect(path: WString, flags: LoadFlags): UserData
```

| Parameter | Description |
|-----------|-------------|
| path      | file name to load |
| flags     | optional load flags |

## Returns

Returns the loaded post-processing effect if successful, otherwise `nil` is returned.