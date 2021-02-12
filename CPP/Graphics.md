# Graphics #
To initialize graphics, the hardware displays must first be queried with the [ListDisplays](ListDisplays.md) function.
A [Window](Window.md) is then created on one of the displays and a [Framebuffer](Framebuffer.md) is created on the window.
You can also render to a texture using a [TextureBuffer](TextureBuffer.md) object.

2D drawing is performed by first creating a [SpriteLayer](SpriteLayer.md) and then creating [Sprite](Sprite.md) objects. You can create sprites as rectangles or as text rendered from a [Font](Font.md).

If you want to build an application that does not perform any rendering, such as a dedicated server for a networked game, you can simply skip window creation and never render the world.

## Classes ##

| Name | Description |
| ----- | ----- |
| Display | |
| Font | |
| Framebuffer | |
| Pixmap | |
| Sprite | |
| SpriteLayer | |
| TextureBuffer | |
| Window | |