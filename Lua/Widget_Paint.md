# Widget:Paint

This function sends a paint message to the user interface signaling the widget to be redrawn. 

## Syntax

- **Paint**(number x, number y, number width, number height)
- **Paint**()

| Parameter | Description |
|---|---|
| x | x position of the region to paint |
| y | y position of the region to paint |
| width | width of the region to paint |
| height | height of the region to paint |

## Remarks

In most cases, a widget will be automatically drawn when needed. However, this function provides a way to force a redraw.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

-- Load an asset
local path = GetPath(PATH_DOCUMENTS) .. "/temp.dds"
if not CopyFile("https://github.com/UltraEngine/Documentation/raw/master/Assets/Materials/Ground/dirt01.dds", path) then
    RuntimeError("Failed to download pixmap.")
end

-- Load the file from the hard drive
local pixmap = LoadPixmap(path)

-- Show the pixmap
ui.background:SetPixmap(pixmap)

local button = CreateButton("Modify Pixmap", 10, 10, 100, 30, ui.background)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == button then
            -- Make a copy of the pixmap, modify it, and overwrite the file
            local pixmap2 = Pixmap(pixmap:Copy())
            if pixmap2.format ~= TEXTURE_RGBA then
                pixmap2 = pixmap2:Convert(TEXTURE_RGBA)
            end
            local px = Random(0, pixmap.size.x - 1 - 100)
            local py = Random(0, pixmap.size.y - 1 - 100)
            local color = Rgba(Random(255), Random(255), Random(255), 255)
            for x = 0, 99 do
                for y = 0, 99 do
                    pixmap2:WritePixel(px + x, py + y, color)
                end
            end
            pixmap2:Save(path)

            -- Reload the pixmap from the file
            pixmap:Reload()

            -- Redraw the panel
            ui.background:Paint()
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        break
    end
end
```
