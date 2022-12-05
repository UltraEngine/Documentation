# Pixmap::Save

This function saves the pixmap to a texture or image file.

## Syntax

- bool **Save**(const string& path, const SaveFlags flags = SAVE_DEFAULT)
- bool **Save**(const wstring& path, const SaveFlags flags = SAVE_DEFAULT)

| Parameter | Description |
| --| --|
| **path** | File name to save to. |
| **flags** | Optional save settings. |

## Returns

Returns true if the file was successfully saved, otherwise false is returned.

## Remarks

The following formats are supported:

| Format | Type | Save Method |
|--|--|--|
| BMP | FreeImage plugin |
| DDS | Native support |
| JPG | FreeImage plugin |
| KTX2 | KTX plugin |
| PNG | FreeImage plugin |
| PSD | FreeImage plugin |
| TGA | FreeImage plugin |

Support for saving new formats can be added with the [plugin system](Plugins.md).
