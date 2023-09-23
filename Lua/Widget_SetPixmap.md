# Widget:SetPixmap

This method sets a widget pixmap. It is preferable to use the [Widget:SetIcon](Widget_SetIcon.md) method if the vector image is available, as it will be resolution-independent.

## Syntax

- **SetPixmap**([Pixmap](Pixmap.md) pixmap, number alignment = PIXMAP_CENTER)

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
local pixmap = LoadPixmap("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/dirt01.dds")

-- Show the pixmap
ui.background:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
