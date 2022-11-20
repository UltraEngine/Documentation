# Texture::SetSubPixels

This method sets the image data for an area of the texture.

## Syntax

- void **SetSubPixels**(shared_ptr<[Pixmap](Pixmap.md)\> pixmap, int x, int y, int width, int height, int dstx, int dsty, const int miplevel = 0, const int layer = 0)
  
| Parameter | Description |
|---|---|
| x, y | position on the source image to read from |
| width, height | dimensions of the area to copy |
| dstx, dsty | position on the texture to write to |
| miplevel | destination mipmap level |
| layer | destination layer or cubemap face |
  
## Remarks
  
The provided pixmap must use the same format as the texture, and have the same dimensions as the specified miplevel.
