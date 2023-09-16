# FileTime

This function gets the size of a file.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4.1) **FileTime**([string](https://www.lua.org/manual/5.4/manual.html#6.4.1) path, boolean packages = true)

## Parameters

| Parameter | Description |
|---|---|
| path | The file path to check. |
| packages | If set to `true`, all loaded packages will be checked after the file system. |

## Example
```lua
local path = CurrentDir()

local dir = LoadDir(path)
if path == "" then
    path = "."
end

for i, file in ipairs(dir) do
    print("Name: " .. file)
    if path ~= "" then
        file = path .. "/" .. file
    end
    print("Type: " .. FileType(file))
    print("Time: " .. FileTime(file))
    print("Size: " .. FileSize(file))
    print("Hidden: " .. FileHidden(file))
    print("")
end
```
