# Pixmap #

**Base class**: [Asset](Asset.md)

This class provides an interface for loading, manipulating, and saving image data.

### Properties ###

| Name | Type | Description |
| ----- | ----- | ----- |
| format | const [TextureFormat](Constants.md#TextureFormat)&  | format of the pixel data |
| size | const iVec2&  | size of the pixmap |
| blocks | const iVec2&  | number of blocks in the image, for compressed formats |
| pixels | const shared_ptr<[Buffer](Buffer.md)\>&  | buffer containing pixel data |
| blocksize | const int&  | size of each block, for compressed formats |
| Convert | Method | converts a pixmap to another format |
| Fill | Method | |
| MakeNormalMap | Method | |
| ReadPixel | Method | |
| Resize | Method | |
| Swizzle | Method | |
| WritePixel | Method | |
| [CreatePixmap](LoadPixmap.md) | Function | Creates a new pixmap object. |
| [LoadPixmap](LoadPixmap.md) | Function | Loads a pixmap object from a file. |
