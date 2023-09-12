# RequestDir #
This function displays a file dialog and lets the user select a folder.

## Syntax ##
- **RequestDir**(title: [string](String.md) = "Open Folder", dir: [string](String.md) = ""): [string](String.md)

## Example
```lua
local file = RequestDir("Open Folder")
print(file)
```