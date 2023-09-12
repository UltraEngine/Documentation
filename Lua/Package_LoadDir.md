# Package:LoadDir

This function retrieves all the files and folders found in a package directory.

## Syntax

```lua
function LoadDir(path)
```

## Parameters

- `path` - relative path to the package directory. (Type: string)

## Returns

- `results` - an array of file names found in the specified directory, if it exists. (Type: table)

## Example

```lua
local package = require("package") -- Assume the package library is imported

local files = package.LoadDir("path/to/package")
for i, file in ipairs(files) do
    print(i, file)
end
```