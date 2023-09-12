# TextureBuffer:GetColorAttachment

This method returns a texture buffer's color texture.

## Syntax

    texture, err = TextureBuffer:GetColorAttachment(index)

## Parameters

- `index` (optional): The color attachment index to get. Default value is 0.

## Returns

- `texture`: The color attachment at the specified index.
- `err`: An error message if an error occurred during the process.

## Example

```lua
-- Assuming TextureBuffer object is already created.
local texture, err = textureBuffer:GetColorAttachment(index)
if texture then
    print("Color attachment found:", texture)
else
    print("Failed to get color attachment:", err)
end
```