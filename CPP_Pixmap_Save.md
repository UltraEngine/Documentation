# Pixmap::Save #
This function saves the pixmap to a texture file.

## Syntax ##
- bool **Save**(const string& path, const SaveFlags flags = SAVE_DEFAULT)
- bool **Save**(const wstring& path, const SaveFlags flags = SAVE_DEFAULT)

### Parameters ###

| Name | Description |
| --| --|
| **path** | File name to save to. |
| **flags** | Optional save settings. |

## Returns ##
Returns true if the file was successfully saved, otherwise false is returned.

## Remarks ##

The following formats are supported:

| Format | Method |
|--|--|
| BASIS | Basis Universal plugin |
| BMP | FreeImage plugin |
| DDS | Internal |
| JPG | FreeImage plugin |
| PNG | FreeImage plugin |
| PSD | FreeImage plugin |
| TGA | FreeImage plugin |

Support for saving new image and texture formats can be added with the plugin system.
