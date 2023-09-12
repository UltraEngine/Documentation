# texture_buffer:set_depth_attachment

This function sets a texture buffer's depth texture.

## Syntax

```lua
function texture_buffer:set_depth_attachment(texture)
```

## Parameters

- `texture` (userdata): The depth attachment to set.

## Returns

- `true` if the depth attachment is set, otherwise `false`.

## Remarks

The specified texture must use a renderable depth format.

The specified texture must have been created with the TEXTURE_BUFFER flag.

The specified texture must be the same dimensions as the texture buffer.