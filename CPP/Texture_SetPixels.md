# Texture::SetPixels

This method sets the image data of a texture.

## Syntax

- void **SetPixels**(shared_ptr<[Pixmap](Pixmap.md)> pixels, const int miplevel = 0, const int layer = 0)

| Parameter | Description |
|---|---|
| pixels | pixel data to set |
| miplevel | the mipmap level to set |
| face | texture layer or cubemap face |

## Remarks

The provided pixmap must use the same format as the texture, and have the same dimensions as the specified miplevel.
