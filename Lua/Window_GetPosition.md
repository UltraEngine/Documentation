# Window:GetPosition

This method returns the position of a window in screen coordinates.

## Syntax

- [iVec2](iVec2.md) **GetPosition**()

## Returns

Returns the window position.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

-- Display window position
local sz = ui.background:ClientSize()
local label = CreateLabel("", 0, 0, sz.x, sz.y, ui.background, LABEL_CENTER | LABEL_MIDDLE)
label:SetLayout(1, 1, 1, 1)

local pos = window:GetPosition()
label:SetText("Window position: " .. tostring(pos.x) .. " x " .. tostring(pos.y))

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWMOVE then
        pos = window:GetPosition()
        label:SetText("Window position: " .. tostring(pos.x) .. " x " .. tostring(pos.y))
    elseif ev.id == EVENT_WINDOWCLOSE then
        return
    end
end
```
