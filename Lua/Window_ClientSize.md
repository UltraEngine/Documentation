# Window:ClientSize

This method returns the dimensions of the drawable area inside a window, excluding the title bar and borders.

## Syntax

- [iVec2](iVec2.md) **ClientSize**()

## Returns

Returns the window client size.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

-- Create user interface
local ui = CreateInterface(window)

-- Display window size
local sz = ui.background:ClientSize()
local label = CreateLabel("", 0, 0, sz.x, sz.y, ui.background, LABEL_CENTER | LABEL_MIDDLE)
label:SetLayout(1, 1, 1, 1)

sz = window:GetSize()
local csz = window:ClientSize()
label:SetText("Window size: " .. tostring(sz.x) .. " x " .. tostring(sz.y) .. "\n\nClient size: " .. tostring(csz.x) .. " x " .. tostring(csz.y))

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWSIZE then
        sz = window:GetSize()
        csz = window:ClientSize()
        label:SetText("Window size: " .. tostring(sz.x) .. " x " .. tostring(sz.y) .. "\n\nClient size: " .. tostring(csz.x) .. " x " .. tostring(csz.y))
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
