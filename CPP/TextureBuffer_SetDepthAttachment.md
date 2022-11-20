# TextureBuffer::SetDepthAttachment

This method sets a texture buffer's depth texture.

## Syntax

- bool **SetDepthAttachment**(shared_ptr<[Texture](Texture.md)\> texture)

| Parameter | Description |
|---|---|
| texture | depth attachment to set |

## Returns

Returns true of the depth attachment is set, otherwise false is returned.

## Remarks

The specified texture must use a renderable depth format and must have been created with the TEXTURE_BUFFER flag.
