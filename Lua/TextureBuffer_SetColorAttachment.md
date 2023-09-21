# TextureBuffer:SetColorAttachment

This method sets a texture buffer's color texture.

## Syntax

- boolean **SetColorAttachment**([Texture](Texture.md) texture, number index = 1)

| Parameter | Description |
|---|---|
| texture | color attachment to set |
| index | color attachment index to use, from 1 to 4 |

## Returns

Returns true of the color attachment is set, otherwise false is returned.

## Remarks

The specified texture must use a renderable color format.

The specified texture must have been created with the TEXTURE_BUFFER flag.

The specified texture must be the same dimensions as the texture buffer.

The index value must be less than 5.

The index value must be between 0 and the value returned by [TextureBuffer::CountColorAttachments](TextureBuffer_CountColorAttachments.md).
