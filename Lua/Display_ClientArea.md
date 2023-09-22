# Display:ClientArea

This method returns the usable area within a screen, excluding system task bars or other decorations.

## Syntax

[iVec4](iVec4.md) **ClientArea**()

## Returns

Returns the usable area of the screen.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

local area = displays[1]:ClientArea()

-- Create a window
local window = CreateWindow("Ultra Engine", area.x, area.y, area.width, area.height, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

-- Create User Interface
local ui = CreateInterface(window)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
