# Icon::Rasterize #

This method generates a pixmap from a vector image. A scaling value can be used to create the pixmap at any magnification level.

## Syntax ##
- shared_ptr<[Pixmap](Pixmap.md)\> **Rasterize**(const float scale = 1.0f, const bool cached = true)

### Parameters ###
| Name | Description |
| --- | --- |
| scale | magnification value to create scaled versions of the image |
| cached | if set to true the routine will search for a cached pixmap at the specified scale, otherwise a new pixmap will always be generated |

## Returns ##
Returns a pixmap at the specified scale.