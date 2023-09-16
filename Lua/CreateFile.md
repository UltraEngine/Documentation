# CreateFile

This function creates a new file on the user's hard drive. The new file will initially be empty. If a file exists at this location it will be overwritten.

## Syntax

- boolean **CreateFile**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
|---|---|
| path | file path to use |

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Create a new file
if not CreateFile(path) then
    print("Failed to write file.")
    return 0
end

OpenDir(path)
```
