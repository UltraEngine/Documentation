# Widget.GetValue

This method gets the value of a slider widget.

## Syntax

- **int** Widget:GetValue()

## Returns

Returns the currently set widget value.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.root:ClientSize()

-- Create scrollbar
local slider1 = CreateSlider(10, 10, 200, 30, ui.root, SLIDER_SCROLLBAR)
slider1:SetRange(3, 10)

-- Create scrollbar
local slider2 = CreateSlider(10, 10 + 50, 200, 30, ui.root, SLIDER_SCROLLBAR)
slider2:SetRange(1, 10)

-- Create trackbar
local slider3 = CreateSlider(10, 10 + 100, 200, 30, ui.root, SLIDER_TRACKBAR)
slider3:SetRange(10, 20)
slider3:SetValue(15)

while true do
    local ev = WaitEvent()
    local widget

    if ev.id == EVENT_WIDGETACTION then
        widget = ev.source:AsWidget()
        Print("Slider value: " .. tostring(widget:GetValue()))
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
