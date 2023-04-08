# GetFilePattern

## Syntax

string **GetFilePattern**(number category, boolean save = false)

| Parameter | Description |
|---|---|
| category | can be any combination of the constants below |
| save | true for a save file dialog or false for an open file dialog |

## Returns


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
local pattern = GetFilePattern(FILECATEGORY_MODEL | FILECATEGORY_TEXTURE)
RequestFile("Open File", "", pattern)
```
