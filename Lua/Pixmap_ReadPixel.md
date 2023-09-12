# Pixmap:ReadPixel

This method writes each pixel of the pixmap with the specified color.

## Syntax

- **ReadPixel**(x: number, y: number): number

## Parameters

- `x`: The x position of the pixel to read.
- `y`: The y position of the pixel to read.

## Returns

Returns the [RGBA](Rgba.md) color of the specified pixel.

This method will not work with compressed pixel formats.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

-- Create user interface
local ui = CreateInterface(window)

-- Load a pixmap
local pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds")
pixmap = pixmap:Convert(TEXTURE_RGBA)

-- Write pixel data using the ReadPixel method
for x = 0, pixmap.size.x - 1 do
    for y = 0, pixmap.size.y - 1 do
        local rgba = pixmap:ReadPixel(x, y)
        local r = Red(rgba)
        local g = 0
        local b = 0
        rgba = Rgba(r, g, b, 255)
        pixmap:WritePixel(x, y, rgba)
    end
end

-- Show the pixmap
ui.root:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```