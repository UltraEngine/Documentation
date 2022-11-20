# CreateTextureBuffer

This function creates a new texture buffer, for render-to-texture operations.

## Syntax

- shared_ptr<[TextureBuffer](TextureBuffer.md)> **CreateTextureBuffer**(const int width, const int height, const int colorattachments = 1, const bool depthattachment = true)

| Parameter | Description |
|---|---|
| width, height | dimensions of the texture buffer |
| colorattachments | number of color textures to add |
| depthattachment | set to true to add a depth texture |

## Returns

Returns a new texture buffer object.
