# CreatePixmap

This function creates a new pixmap with the specified size and format.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> CreatePixmap(const int width, const int height, const TextureFormat format = TEXTURE_RGBA, shared_ptr<[Buffer](Buffer.md)> pixeldata = NULL)

| Parameter | Description |
|---|---|
| width | width of the pixmap |
| height | height of the pixmap |
| format | pixmap pixel format |
| pixeldata | if specified the pixmap pixel data will be filled with the buffer contents |

## Returns
Returns a new pixmap object.
