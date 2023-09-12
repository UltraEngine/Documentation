# Texture:SetPixels

This method sets the image data of a texture.

## Syntax

```lua
Texture:SetPixels(pixels, miplevel, layer)
```

## Parameters

| Parameter | Description |
|---|---|
| `pixels` | pixel data to set |
| `miplevel` | the mipmap level to set |
| `layer` | texture layer or cubemap face |

## Remarks

The provided pixmap must use the same format as the texture and have the same dimensions as the specified miplevel.

## Example

```lua
-- Create a pixmap with the same format and dimensions as the texture
local pixmap = Pixmap(texture:GetFormat(), texture:GetWidth(), texture:GetHeight())

-- Set the pixels of the pixmap with the desired data
-- ...

-- Set the pixels of the texture at miplevel 0 and layer 0
texture:SetPixels(pixmap, 0, 0)
```