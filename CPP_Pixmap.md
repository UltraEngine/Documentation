# Pixmap #

This class provides an interface for loading, manipulating, and saving image data. Pixmaps cannot be displayed directly on the screen, but can be used to build a [Texture](CPP_Textures.md), which can be applied to a [Material](API_Material.md) and displayed on a [Model](API_Model.md) or [Sprite](API_Sprite.md).

### Properties ###

| Name | Type | Description |
| ----- | ----- | ----- |
| **format** | const [TextureFormat](Constants.md#TextureFormat)&  | format of the pixel data |
| **size** | const iVec2&  | size of the pixmap |
| **blocks** | const iVec2&  | number of blocks in the image, for compressed formats |
| **pixels** | const shared_ptr\<[Buffer](Buffer.md)\>&  | buffer containing pixel data |
| **blocksize** | const int&  | size of each block, for compressed formats |
| Convert | Method | converts a pixmap to another format |
| Fill | Method | |
| MakeNormalMap | Method | |
| ReadPixel | Method | |
| Resize | Method | |
| [Save](Pixmap_Save.md) | Saves a pixmap to an image or texture file. |Method | |
| Swizzle | Method | |
| WritePixel | Method | |
| [CreatePixmap](LoadPixmap.md) | Function | Creates a new pixmap object. |
| [LoadPixmap](LoadPixmap.md) | Function | Loads a pixmap object from a file. |
