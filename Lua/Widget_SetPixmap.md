# Widget:SetPixmap

This method sets a widget pixmap. It is preferable to use the [Widget:SetIcon](Widget_SetIcon.md) method if the vector image is available, as it will be resolution-independent.

## Syntax
- **Widget:SetPixmap**(pixmap, alignment)

| Parameter | Description |
|---|---|
| pixmap | pixmap to set |
| alignment | may be set to PIXMAP_CENTER, PIXMAP_CONTAIN, PIXMAP_COVER, or PIXMAP_STRETCH |

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

-- Create a pixmap
local pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds")

-- Show the pixmap
ui.root:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```