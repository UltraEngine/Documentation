# Rendering #
To initialize rendering, the hardware displays must first be queried with [ListDisplays](API_ListDisplays.md).
A [Window](API_Window.md) is then created on one of the displays and a [Framebuffer](API_Framebuffer.md) is created on the window.
You can also render to a texture using a [TextureBuffer](API_TextureBuffer.md) object.

If you want to build an application that does not perform any rendering, such as a dedicated server for a networked game, you can run your program without creating a window.

## Classes ##
| Name | Description |
| --- | --- |
| [Display](API_Display.md) | |
| [Framebuffer](API_Framebuffer.md) | |
| [TextureBuffer](API_TextureBuffer.md) | |
| [Window](API_Window.md) | |
