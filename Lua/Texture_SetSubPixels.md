# Texture:SetSubPixels

This method sets the image data for an area of the texture.

## Syntax

```lua
function Texture:SetSubPixels(pixmap, x, y, width, height, dstx, dsty, miplevel, layer)
```

| Parameter | Description |
|---|---|
| pixmap | shared pointer to the pixmap object |
| x, y | position on the source image to read from |
| width, height | dimensions of the area to copy |
| dstx, dsty | position on the texture to write to |
| miplevel | destination mipmap level (optional, default = 0) |
| layer | destination layer or cubemap face (optional, default = 0) |

## Remarks

The provided pixmap must use the same format as the texture and have the same dimensions as the specified miplevel.

If the specified area lies outside the bounds of the source or destination image, it will be automatically trimmed.