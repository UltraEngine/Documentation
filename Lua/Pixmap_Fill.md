# pixmap:fill

This method writes each pixel of the pixmap with the specified color.

## Syntax

- **pixmap:Fill**(color: integer)
- **pixmap:Fill**(color: [Vec4](Vec4))

Parameter | Description
---|---
color | [RGBA](Rgba.md) or [Vec4](Vec4) color

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
pixmap:Fill(RGBA(0, 0, 0, 255))

-- Show the pixmap
ui.root:SetPixmap(pixmap)

local button = CreateButton("Modify Pixmap", 10, 10, 100, 30, ui.root)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION and ev.source == button then
        -- Fill the pixmap with a new color
        pixmap:Fill(Rgba(Random(255), Random(255), Random(255), 255))

        -- Redraw the panel
        ui.root:Paint()
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```