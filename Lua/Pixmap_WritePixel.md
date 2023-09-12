# Pixmap:WritePixel

This method sets a single pixel in the pixmap to the specified color.

## Syntax

- **Pixmap:WritePixel**(x, y, color)
- **Pixmap:WritePixel**(x, y, color)

| Parameter | Description |
|---|---|
| x | x position of the pixel to write |
| y | y position of the pixel to write |
| color | RGBA or Vec4 color |

## Remarks

This command is thread-safe, as long as multiple threads do not write to the same region. See the [ThreadPool](ThreadPool_Execute.md) class for an example of multi-threaded use.

This method will not work with compressed pixel formats.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

-- Create a pixmap
local pixmap = CreatePixmap(512, 512)
 
-- Write pixel data
for x = 0, 511 do
    for y = 0, 511 do
        pixmap:WritePixel(x, y, Vec4(255 * x / 512.0, 255 * y / 512.0, 0, 255))
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