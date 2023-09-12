# TextureBuffer:SetColorAttachment

This method sets a texture buffer's color texture.

## Syntax

```lua
function TextureBuffer:SetColorAttachment(texture, index)
```

### Parameters

- `texture`: color attachment to set
- `index` (optional): color attachment index to set

## Returns

Returns `true` if the color attachment is set, otherwise `false` is returned.

## Remarks

The specified texture must use a renderable color format.

The specified texture must have been created with the TEXTURE_BUFFER flag.

The specified texture must be the same dimensions as the texture buffer.

The `index` value must be less than 4.

The `index` value must be between 0 and the value returned by `TextureBuffer:CountColorAttachments`.