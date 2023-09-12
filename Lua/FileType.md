# FileType

This function detects the type of a specified file path.

## Syntax

- **FileType**(path: string, packages: boolean): number

  - `path`: file path to read
  - `packages`: if true then any loaded packages will be checked after the file system

## Returns

Returns 1 if the specified path is a file, 2 if it is a folder, or 0 if it does not exist.

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