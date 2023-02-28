# AssetEditor:SaveFile

This method saves an opened file in the asset editor.

## Syntax

- boolean **SaveFile**()
- boolean **SaveFile**(number index)

| Parameter | Description |
|---|---|
| index | index of the file to save, if specified, otherwise the currently selected item is saved |

## Returns

Returns true if the specified file was saved, otherwise false is returned.

## Example

```lua
--Download a file from the web and open it
local index = program.asseteditor:OpenFile("https://www.github.com/ultraengine/...")

--Save the file
if index > -1 then program.asseteditor:Save() end
```
