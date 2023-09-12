# Pixmap:Convert

```lua
-- Converts the pixmap to the specified pixel format
-- @param format The pixel format to convert to
-- @return The converted pixmap if successful, otherwise nil is returned
function Pixmap:Convert(format)
    -- Code implementation here
end
```

## Syntax

```lua
-- Code implementation here
```

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

-- Convert to single red channel
pixmap = pixmap:Convert(TEXTURE_RED)

-- Show the pixmap
ui.root:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```