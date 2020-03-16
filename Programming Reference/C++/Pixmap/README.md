# Pixmap

The pixmap class is a container for storing and manipulating image data. Pixmaps are not textures and cannot be viewed directly, but can be used to create textures or image files.

## Members

- const shared_ptr<Buffer>& pixels: Read-only variable indicating the buffer that contains the pixel data.
- const iVec3 size: Read=only variable indicating the pixmap width, height and number of layers.

## Methods

- Save
- Resize
- ReadPixel
- WritePixel

## Functions

- CreatePixmap
- LoadPixmap
- SaveTexture

## Examples
