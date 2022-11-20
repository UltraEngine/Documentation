# TextureBuffer::SetColorAttachment

This method sets a texture buffer's color texture.

## Syntax

- bool **SetColorAttachment**(shared_ptr<[Texture](Texture.md)\> texture, const int index = 0)

| Parameter | Description |
|---|---|
| texture | color attachment to set |
| index | color attachment index to set |

## Returns

Returns true of the color attachment is set, otherwise false is returned.

## Remarks

The specified texture must use a renderable color format and must have been created with the TEXTURE_BUFFER flag.
