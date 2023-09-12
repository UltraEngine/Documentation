# Package:FileType

This function returns the type of a file in the archive.

## Syntax

`FileType(path: string): number`

## Parameters

- `path` (string): relative file path

## Returns

If the file exists, then one or two will be returned for a file or folder. Otherwise, zero will be returned.

Some package plugins may return three if they support packages-in-packages. This indicates that the file is a package that has already had its contents loaded into the parent package, and it can be treated as a file or a folder.

## Example

```lua
local fileType = Package.FileType("/path/to/file.lua")
print(fileType) -- Prints 1 for a file, 2 for a folder, or 3 for a package-in-package file
```