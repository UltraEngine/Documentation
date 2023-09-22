# Pixmap:Fill

This method writes each pixel of the pixmap with the specified color.

## Syntax

- **Fill**([Vec4](Vec4) color)
- **Fill**(number r, number g, number b, number a = 1)
- **Fill**(number color)

| Parameter | Description |
|---|---|
| color, (r,g,b,a) | [RGBA](Rgba.md) or [Vec4](Vec4) color |

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
pixmap:Fill(Rgba(0, 0, 0, 255))

-- Show the pixmap
ui.background:SetPixmap(pixmap)

local button = CreateButton("Modify Pixmap", 10, 10, 100, 30, ui.background)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION and ev.source == button then

        -- Fill the pixmap with a new color
        pixmap:Fill(Rgba(Random(255), Random(255), Random(255), 255))

        -- Redraw the panel
        ui.background:Paint()

    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
