# Pixmap

Base class: [Asset](Asset.md)

This class provides an interface for loading, manipulating, and saving image data.

| Property | Type | Description |
| ----- | ----- | ----- |
| format | number | read-only format of the pixel data |
| size | [iVec2](iVec2.md)  | read-only size of the pixmap |
| blocks | [iVec2](iVec2.md)  | read-only number of blocks in the image, for compressed formats |
| pixels | [Buffer](Buffer.md)  | buffer containing pixel data |
| blocksize | number  | read-only size of each block, for compressed formats |
| [Blit](Pixmap_Blit.md) | Method | copies an area of a pixmap to another pixmap, with scaling and filtering |
| [Convert](Pixmap_Convert.md) | Method | converts a pixmap to another format |
| [CopyRect](Pixmap_CopyRect.md) | Method | copies an area of a pixmap to another pixmap |
| [Extract](Pixmap_Extract.md) | Method | extracts part of the pixmap into a new pixmap |
| [Fill](Pixmap_Fill.md) | Method | writes each pixel with the specified color |
| [ReadPixel](Pixmap_ReadPixel.md) | Method | reads a single pixel |
| [Resize](Pixmap_Resize.md) | Method | resizes the pixmap |
| [Sample](Pixmap_Sample.md) | Method | reads a pixel sample with bilinear filtering |
| [WritePixel](Pixmap_WritePixel.md) | Method | writes a single pixel |
| [CreatePixmap](CreatePixmap.md) | Function | Creates a new pixmap object. |
| [LoadPixmap](LoadPixmap.md) | Function | Loads a pixmap object from a file. |
