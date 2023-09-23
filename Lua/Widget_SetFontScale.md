# Widget:SetFontScale

This method sets the font scale to make text relatively larger or smaller. The font scale will adjust with DPI scaling so it only needs to be set once.

## Syntax

- **SetFontScale**(number scale)

| Parameter | Description |
| --- | --- |
| scale | font scale to set (default is 1.0) |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER | WINDOW_RESIZABLE)

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()

local label = CreateLabel("Font scale:", 10, 10, sz.x - 20, 30, ui.background)

local slider = CreateSlider(10, 40, sz.x - 20, 30, ui.background, SLIDER_TRACKBAR)
slider:SetLayout(1,1,1,0)
slider:SetRange(1, 40)
slider:SetValue(4)
EmitEvent(EVENT_WIDGETACTION, slider, 4)

local textarea = CreateTextArea(10, 75, sz.x - 20, sz.y - 85, ui.background, TEXTAREA_WORDWRAP)
textarea:SetLayout(1,1,1,1)
textarea:SetText("The quick brown fox jumps over the lazy dog.")

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == slider then
            textarea:SetFontScale(ev.data / 4.0)
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
