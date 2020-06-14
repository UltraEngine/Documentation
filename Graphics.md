# Graphics #
To initialize graphics, the hardware displays must first be queried with the [ListDisplays](API_ListDisplays.md) function.
A [Window](API_Window.md) is then created on one of the displays and a [Framebuffer](API_Framebuffer.md) is created on the window.
You can also render to a texture using a [TextureBuffer](API_TextureBuffer.md) object.

2D drawing is performed by first creating a [SpriteLayer](API_SpriteLayer.md) and then creating [Sprite](API_Sprite.md) objects. You can create sprites as rectangles or as text rendered from a [Font](API_Font.md).

If you want to build an application that does not perform any rendering, such as a dedicated server for a networked game, you can simply skip window creation and never render the world.
