# Pixmap::Blit

This method copies an area of one pixmap to another with scaling and filtering. Pixels that lie outside the area of the destination pixmap will be skipped.

## Syntax

- bool **CopyRect**(const int x, const int y, const int width, const int height, shared_ptr<[Pixmap](Pixmap.md)> dest, const int destx, const int desty, const int destwidth, const int destheight)
- bool **CopyRect**(const float u, const float v, const int width, const int height, shared_ptr<[Pixmap](Pixmap.md)> dest, const int destx, const int desty, const int destwidth, const int destheight)

| Parameter | Description |
|---|---|
| x, y | source copy position |
| width, height | source copy area |
| dst | destination pixmap |
| dx, dy | destination write position |
  
## Returns
  
Returns true if any pixels are written.
  
If the destination pixmap is NULL then false is returned.
  
If the destination area does not overlap the destination pixmap then false is returned.
  
If the destination pixmap format does not match this pixmap's format then false is returned.

If the pixmap block size is greater than one, as it is for compressed formats, then false is returned.

If the pixmap format does not support blitting, then false is returned.
