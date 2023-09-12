# ChangeDir

This function changes the current directory. Relative file paths will be loaded from the new directory.

## Syntax

```lua
function ChangeDir(path: string): boolean
```

- `path`: folder location to move to

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
