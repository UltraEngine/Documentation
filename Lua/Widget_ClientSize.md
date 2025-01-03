# Widget:ClientSize

This method returns the dimensions of the drawable area inside a widget, excluding any padding.

## Syntax

- [iVec2](iVec2.md) **ClientSize**()

## Returns

Returns the widget client size. This is the area inside the widget with all borders removed, inside which a child widget may be created.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()

-- Create widget
local panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.background)
panel:SetColor(0, 0, 0, 1)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
