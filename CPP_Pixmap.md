# Pixmap #

This class provides an interface for loading, manipulating, and saving image data. Pixmaps cannot be displayed directly on the screen, but can be used to build a [Texture](CPP_Textures.md), which can be applied to a [Material](API_Material.md) and displayed on a [Model](API_Model.md) or [Sprite](API_Sprite.md).

## Members ##

| Name | Type | Description |
| ----- | ----- | ----- |
| **format** | const [TextureFormat](Constants.md#TextureFormat)&  | format of the pixel data |
| **size** | const iVec2&  | format of the pixel data |
| **blocks** | const iVec2&  |  format of the pixel data |
| **pixels** | const shared_ptr<Buffer>&  | format of the pixel data |
| **blocksize** | const int&  | format of the pixel data |

## Methods ##

| Name | Description |
|-----|-----|
| Convert | |
| Fill | |
| MakeNormalMap | |
| ReadPixel | |
| Resize | |
| [Save](API_Pixmap_Save.md) | Saves a pixmap to an image or texture file. |
| Swizzle | |
| WritePixel | |

## Functions ##

| Name | Description |
|-----|-----|
| [CreatePixmap](API_LoadPixmap.md) | Creates a new pixmap object. |
| [LoadPixmap](API_LoadPixmap.md) | Loads a pixmap object from a file. |
