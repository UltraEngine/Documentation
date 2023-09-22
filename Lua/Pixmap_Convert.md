# Pixmap:Convert

This method converts a pixmap's pixels to another format.

## Syntax

- [Pixmap](Pixmap.md) **Convert**(number format)

| Parameter | Description |
|---|---|
| format | pixel format to convert to |

## Returns

Returns a pixmap with the new pixel format if successful, otherwise NULL is returned.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

-- Create user interface
local ui = CreateInterface(window)

-- Load a pixmap
local pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds")

-- Convert to single red channel
pixmap = pixmap:Convert(TEXTURE_RED)

-- Show the pixmap
ui.background:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
