# Icon

This class provides an interface for loading and rasterising vector images. Unlike pixmaps, icons can be used for resolution-independent graphics.

Base class: [Asset](Asset.md)

| Property | Type | Description |
| ----- | ----- | ----- |
| size | [iVec2](iVec2.md)  | default size of the image, in pixels |
| [Rasterize](Icon_Rasterize.md) | Method | Generates a pixmap |
| [LoadIcon](LoadIcon) | Function | Loads an icon object from a file |

## Method: Rasterize

```lua
function Icon:Rasterize()
``` 

Generates a pixmap.

## Function: LoadIcon

```lua
function LoadIcon(file)
``` 

Loads an icon object from a file.
