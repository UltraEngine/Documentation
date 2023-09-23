# Widget:SetValue

This method sets the value of a slider widget.

## Syntax

- **SetValue**(number value)

| Parameter | Description |
|---|---|
| value | new value to set |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()

-- Create scrollbar
local slider1 = CreateSlider(10, 10, 200, 30, ui.background, SLIDER_SCROLLBAR)
slider1:SetRange(3, 10)

-- Create scrollbar
local slider2 = CreateSlider(10, 10 + 50, 200, 30, ui.background, SLIDER_SCROLLBAR)
slider2:SetRange(1, 10)

-- Create trackbar
local slider3 = CreateSlider(10, 10 + 100, 200, 30, ui.background, SLIDER_TRACKBAR)
slider3:SetRange(10, 20)
slider3:SetValue(15)

while true do
    local ev = WaitEvent()
    local widget
    if ev.id == EVENT_WIDGETACTION then
        widget = Widget(ev.source)
        Print("Slider value: " .. tostring(widget:GetValue()))
    elseif ev.id == EVENT_WINDOWCLOSE then
        return
    end
end
```
