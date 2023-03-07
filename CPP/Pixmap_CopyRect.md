# Pixmap::CopyRect

This method copies an area of one pixmap to another. Pixels that lie outside the area of the destination pixmap will be skipped.

## Syntax

- bool **CopyRect**(const int x, const int y, const int width, const int height, shared_ptr<[Pixmap](Pixmap.md)> dst, const int dx, const int dy)

| Parameter | Description |
|---|---|
| x, y | source copy position |
| width, height | source copy area |
| dst | destination pixmap |
| dx, dy | destination write position |
  
## Returns
  
Returns true if any pixels are copied.
  
If the destination pixmap is NULL then false is returned.
  
If the destination area does not overlap the destination pixmap then false is returned.
  
If the destination pixmap format does not match this pixmap's format then false is returned.

If the pixmap uses a compressed format, such as DXT1 / BC1, DXT5 / BC3, etc., then the source and destination position and the area must be evenly divisible by the block size (4), or false is returned.

If the pixmap uses BC6 or BC7 compression then false is returned.
