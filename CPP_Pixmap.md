# Pixmap #

This class provides an interface for loading, manipulating, and saving image data. Pixmaps cannot be displayed directly on the screen, but can be used to build [Textures](CPP_Textures.md), which can be applied to a material and displayed on a [Model](API_Model.md) or [Sprite](API_Sprite.md).

## Members ##

| Name | Type | Description |
| ----- | ----- | ----- |
| **format** | const TextureFormat&  | format of the pixel data |
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
| Save | |
| Swizzle | |
| WritePixel | |
