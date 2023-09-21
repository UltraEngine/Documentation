# Texture:SetSubPixels

This method sets the image data for an area of the texture.

## Syntax

- **SetSubPixels**([Pixmap](Pixmap.md) pixmap, number x, number y, number width, number height, number dstx, number dsty, number miplevel = 1, number layer = 1)

| Parameter | Description |
|---|---|
| x, y | position on the source image to read from |
| width, height | dimensions of the area to copy |
| dstx, dsty | position on the texture to write to |
| miplevel | destination mipmap level |
| layer | destination layer or cubemap face |
  
## Remarks
  
The provided pixmap must use the same format as the texture, and have the same dimensions as the specified miplevel.

If the specified area lies outside the bounds of the source or destinaton image, it will be automatically trimmed.
