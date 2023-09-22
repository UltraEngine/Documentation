# CreatePixmap

This function creates a new pixmap with the specified size and format.

## Syntax

- [Pixmap](Pixmap.md) **CreatePixmap**(number width, number height, number format = TEXTURE_RGBA, [Buffer](Buffer.md) pixeldata = nil)

| Parameter | Description |
|---|---|
| width | width of the pixmap |
| height | height of the pixmap |
| format | pixmap pixel format, can be TEXTURE_RGBA, TEXTURE_RGB, TEXTURE_RG, TEXTURE_BGRA, TEXTURE_BGR, TEXTURE_RED, TEXTURE_RED16, or the compressed formats TEXTURE_BC1, TEXTURE_BC3, TEXTURE_BC5, or TEXTURE_BC7 |
| pixeldata | if specified the pixmap pixel data will be filled with the buffer contents |

## Returns

Returns a new pixmap object.

## Example

```lua
-- Create a pixmap
local pixmap = CreatePixmap(512, 512)
pixmap:Fill(RGBA(0, 0, 255, 255))

-- Show the pixmap
ui.root:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
