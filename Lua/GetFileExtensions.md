# GetFileExtensions

This function is used to retrieve all extensions the editor supports for a file category, either natively or through the use of a plugin.

## Syntax

table **GetFileExtensions**(number category)

| Parameter | Description |
|---|---|
| category | can be any combination of the constants below |

## Returns

Returns a table containing the requested file extensions in an array configuration.

## Remarks

The following constants can be combined in the category parameter:
- FILECATEGORY_MATERIAL
- FILECATEGORY_MODEL
- FILECATEGORY_PACKAGE
- FILECATEGORY_SCENE
- FILECATEGORY_SOUND
- FILECATEGORY_TEXTURE

## Example

```lua
local extensions = GetFileExtensions(FILECATEGORY_MODEL + FILECATEGORY_TEXTURE)
for n = 1, n <= #extensions do
  Print(extensions[n])
end
```
