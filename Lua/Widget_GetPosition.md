# Widget::GetPosition

This method returns the widget position, relative to the parent or the interface.

## Syntax

- [iVec2](iVec2.md) **GetPosition**(boolean global = false)

| Parameter | Description |
|---|---|
| global | if set to false the position is relative to the parent, otherwise it is relative to the interface |

## Returns

Returns the widget position.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()

-- Create widget
local panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.background, PANEL_BORDER)
panel:SetLayout(0, 1, 0, 1)

sz = panel:ClientSize()
local label = CreateLabel("", 0, 0, sz.x, sz.y, panel, LABEL_CENTER | LABEL_MIDDLE)
label:SetLayout(1, 1, 1, 1)

local pos = panel:GetPosition()
label:SetText("Position: " .. tostring(pos.x) .. ", " .. tostring(pos.y))

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    elseif ev.id == EVENT_WINDOWSIZE then
        local pos = panel:GetPosition()
        label:SetText("Position: " .. tostring(pos.x) .. ", " .. tostring(pos.y))
    end
end
```
