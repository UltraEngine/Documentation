# Widget:SetRange

This method sets the range of a slider widget.

## Syntax

- **SetRange**(number x, number y, number increments = 1)

| Parameter | Description |
|---|---|
| x | minimum value for a stepper or trackbar, or visible range for a scrollbar  |
| y | maximum value for a stepper or trackbar, or total range for a scrollbar |
| increments | for scrollbar sliders, the minimum change in value |

## Remarks

If this method is used with a slider widget that uses the STEPPER slider style, the `x` value will be the minimum value and the `y` parameter will be the maximum value returned by [Widget:GetValue](Widget_GetValue.md).

If this method is used with a slider widget that uses the TRACKBAR slider style, the `x` value will be the value [Widget:GetValue](Widget_GetValue.md) returns when the trackbar knob is all the way to the left (or up, for a vertical slider) and the `y` value is the value that will be returned when the slider knob is all the way to the right (or bottom).

If this method is used with a slider widget that uses the SCROLLBAR slider style, the `x` value will be the range the handle takes up, and the `y` value will be the total range of the entire bar excluding the arrow buttons at the ends. For example, calling `SetRange(1,10)` would make the scrollbar handle take up 10% the total length of the bar. The total number of possible values the slider can have will be given by `(y - x) + 1`.

## Example

```lua
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
