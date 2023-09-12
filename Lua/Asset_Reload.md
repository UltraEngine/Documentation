# asset:reload

This method reloads an asset from a file on the disk. If changes were made to the file, they will appear after reloading.

## Syntax

- **asset:Reload**(flags)

  - **flags** (optional): load flags

## Returns
If successful, `true` is returned. Otherwise, `false` is returned.

## Example

```lua
-- Import required libraries
local UltraEngine = require("UltraEngine")

-- Get the displays
local displays = UltraEngine.GetDisplays()

-- Create a window
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create a user interface
local ui = UltraEngine.CreateInterface(window)

-- Load an asset
local path = UltraEngine.GetPath(UltraEngine.PATH_DOCUMENTS) .. "/temp.dds"
if not UltraEngine.CopyFile("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Ground/dirt01.dds", path) then
    UltraEngine.RuntimeError("Failed to download pixmap.")
end

-- Load the file from the hard drive
local pixmap = UltraEngine.LoadPixmap(path)

-- Show the pixmap
ui.root:SetPixmap(pixmap)

local button = UltraEngine.CreateButton("Modify Pixmap", 10, 10, 100, 30, ui.root)

while true do
    local ev = UltraEngine.WaitEvent()
    if ev.id == UltraEngine.EVENT_WIDGETACTION and ev.source == button then
        -- Make a copy of the pixmap, modify it, and overwrite the file
        local pixmap2 = pixmap:Copy():AsPixmap()
        if pixmap2.format ~= UltraEngine.TEXTURE_RGBA then
            pixmap2 = pixmap2:Convert(UltraEngine.TEXTURE_RGBA)
        end
        local px = UltraEngine.Random(0, pixmap.size.x - 1 - 100)
        local py = UltraEngine.Random(0, pixmap.size.y - 1 - 100)
        local color = UltraEngine.RGBA(UltraEngine.Random(255), UltraEngine.Random(255), UltraEngine.Random(255), 255)
        for x = 0, 99 do
            for y = 0, 99 do
                pixmap2:WritePixel(px + x, py + y, color)
            end
        end
        pixmap2:Save(path)

        -- Reload the pixmap from the file
        pixmap:Reload()

        -- Redraw the panel
        ui.root:Paint()
    elseif ev.id == UltraEngine.EVENT_WINDOWCLOSE then
        return 0
    end
end

return 0
```