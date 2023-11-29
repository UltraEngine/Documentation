# Texture.SetSubPixels

This method sets the image data for an area of the texture.

## Syntax

```csharp
public void SetSubPixels(Pixmap pixmap, int x, int y, int width, int height, int dstx, int dsty, int miplevel = 0, int layer = 0)
```

| Parameter | Description |
|---|---|
| x, y | position on the source image to read from |
| width, height | dimensions of the area to copy |
| dstx, dsty | position on the texture to write to |
| miplevel | destination mipmap level |
| layer | destination layer or cubemap face |

## Remarks
  
The provided pixmap must use the same format as the texture, and have the same dimensions as the specified miplevel.

If the specified area lies outside the bounds of the source or destinaton image, it will be automatically cropped.

## Example

```csharp
Pixmap pixmap = new Pixmap(); // create a new Pixmap object
// fill the pixmap with image data
int[] imageData = { 0xFF0000, 0x00FF00, 0x0000FF };
pixmap.SetData(imageData, 3, 1, 0, 0);
int x = 0;
int y = 0;
int width = 1;
int height = 1;
int dstx = 0;
int dsty = 0;
int miplevel = 0;
int layer = 0;

Texture.SetSubPixels(pixmap, x, y, width, height, dstx, dsty, miplevel, layer); // set the sub-pixels on the texture
```