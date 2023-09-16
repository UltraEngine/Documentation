# FileType

This function gets the type of a file.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4.1) **FileType**([string](https://www.lua.org/manual/5.4/manual.html#6.4.1) path, boolean packages = true)

## Parameters

| Parameter | Description |
|---|---|
| path | The file path to check. |
| packages | If set to `true`, all loaded packages will be checked after the file system. |

## Returns

Returns 1 for a file, 2 for a folder, and 0 if the file does not exist.

## Example

```lua
function main()
    path = CurrentDir()

    dir = LoadDir(path)
    if (path == "") then
        path = "."
    end

    for _, file in ipairs(dir) do
        print("Name: " .. file)

        if (path ~= "") then
            file = path .. "/" .. file
        end

        print("Type: " .. tostring(FileType(file)))
        print("Time: " .. tostring(FileTime(file)))
        print("Size: " .. tostring(FileSize(file)))
        print("Hidden: " .. tostring(FileHidden(file)))

        print("")
    end
end

main()
```
