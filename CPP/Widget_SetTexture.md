# Widget::SetTexture

This method applies a texture to the widget. Typically this is used to display the rendering output of a camera that is drawing to a texture using the [Camera::SetRenderTarget](Camera_SetRenderTarget.md) command.

## Syntax

- void **SetTexture**(const shared_ptr<[Texture](Texture.md)\> texture, const PixmapAlignment alignment = PIXMAP_CENTER)

| Parameter | Description |
|---|---|
| texture | texture to apply, or NULL |
| alignment | alignment mode, can be PIXMAP_CENTER, PIXMAP_CONTAIN, PIXMAP_COVER, PIXMAP_STRETCH, or PIXMAP_FIT |

## Remarks

This method will only work with a widget created in a 3D interface.
