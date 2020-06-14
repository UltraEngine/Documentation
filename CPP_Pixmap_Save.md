# Pixmap::Save #
This function saves the pixmap to a texture or image file.

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

| Format | Type | Save Method |
|--|--|--|
| BASIS | Texture | Basis Universal plugin |
| BMP | Image | FreeImage plugin |
| DDS | Texture | Native support |
| JPG | Image | FreeImage plugin |
| PNG | Image | FreeImage plugin |
| PSD | Image | FreeImage plugin |
| TGA | Image | FreeImage plugin |

Support for saving new image and texture formats can be added with the plugin system.
