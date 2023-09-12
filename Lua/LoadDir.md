# loadDir

This function loads the contents of a directory and returns an array of files.

## Syntax

- `loadDir`(path: string, packages: boolean): table[string]

| Parameter | Description |
|---|---|
| path | file path to load |
| packages | if true any loaded packages will be checked for the specified folder after the file system |

## Returns

Returns an array of file names found within the directory. The array will be empty if the specified path contains no files, or if the folder contains no files.
 
 ## Example

```lua
function main(argc, argv)
    local path = UltraEngine.CurrentDir()

    local dir = UltraEngine.loadDir(path)
    if path == "" then
        path = "."
    end
    for _, file in ipairs(dir) do
        print("Name: " .. file)

        if path ~= "" then
            file = path .. "/" .. file
        end

        print("Type: " .. UltraEngine.FileType(file))
        print("Time: " .. UltraEngine.FileTime(file))
        print("Size: " .. UltraEngine.FileSize(file))
        print("Hidden: " .. UltraEngine.FileHidden(file))

        print("")
    end
    return 0
end
```