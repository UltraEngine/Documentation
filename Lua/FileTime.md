# FileTime

This function returns the last time a file at the specified path was created or modified.

```lua
function FileTime(path: WString, packages: boolean): number
```

## Parameters

- `path` (type: [WString](WString.md)): file path to read.
- `packages` (type: boolean, optional): if true, loaded packages will be checked after the file system. Default value is `true`.

## Returns

Returns the file time, in units of 100 nanosecond intervals that have elapsed since 12:00 A.M. January 1, 1601 Coordinated Universal Time (UTC). If the file does not exist, then zero is returned.

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