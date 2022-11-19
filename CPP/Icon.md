# Icon

This class provides an interface for loading and rasterising vector images. Unlike [pixmaps](Pixmap.md), icons can be used for resolution-independent graphics.

Base class: [Asset](Asset.md)

| Property | Type | Description |
| ----- | ----- | ----- |
| size | const [iVec2](iVec2.md)&  | default size of the image, in pixels |
| [Rasterize](Icon_Rasterize.md) | Method | Generates a pixmap |
| [LoadIcon](LoadIcon.md) | Function | Loads an icon object from a file |
