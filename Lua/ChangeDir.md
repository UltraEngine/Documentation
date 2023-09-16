# ChangeDir

This function changes the current directory. Relative file paths will be loaded from the new directory.

## Syntax

- **ChangeDir**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
|---|---|
| path | the file path to use |

## Returns

Returns `true` if the directory was successfully changed, otherwise `false` is returned.

## Example

```lua
-- Print starting directory
print(CurrentDir())

-- Navigate up one directory level
ChangeDir("..")

-- Print new directory
print(CurrentDir())
```
