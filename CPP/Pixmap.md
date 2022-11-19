# Pixmap

Base class: [Asset](Asset.md)

This class provides an interface for loading, manipulating, and saving image data.

| Property | Type | Description |
| ----- | ----- | ----- |
| format | const [TextureFormat](Constants.md#TextureFormat)&  | format of the pixel data |
| size | const iVec2&  | size of the pixmap |
| blocks | const iVec2&  | number of blocks in the image, for compressed formats |
| pixels | const shared_ptr<[Buffer](Buffer.md)\>&  | buffer containing pixel data |
| blocksize | const int&  | size of each block, for compressed formats |
| [Convert](Pixmap_Convert.md) | Method | converts a pixmap to another format |
| [Fill](Pixmap_Fill.md) | Method | writes each pixel with the specified color |
| [ReadPixel](Pixmap_ReadPixel.md) | Method | reads a single pixel |
| [Resize](Pixmap_Resize.md) | Method | resizes the pixmap |
| [Sample](Pixmap_Sample.md) | Method | reads a pixel sample with bilinear filtering |
| [WritePixel](Pixmap_WritePixel.md) | Method | writes a single pixel |
| [CreatePixmap](CreatePixmap.md) | Function | Creates a new pixmap object. |
| [LoadPixmap](LoadPixmap.md) | Function | Loads a pixmap object from a file. |
