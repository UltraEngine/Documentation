# Widget:SetFontBold

This method sets the font weight to make text bold or normal.

## Syntax

- **SetFontBold**(boolean mode)

| Parameter | Description |
|---|---|
| mode | set to true for bold font |

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()

local label = CreateLabel("Font scale:", 10, 10, sz.x - 20, 30, ui.background)

local checkbox = CreateButton("Normal", 10, 40, sz.x - 20, 30, ui.background, BUTTON_CHECKBOX)

local textarea = CreateTextArea(10, 75, sz.x - 20, sz.y - 85, ui.background, TEXTAREA_WORDWRAP)
textarea:SetText("The quick brown fox jumps over the lazy dog.")

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == checkbox then
            if ev.data == 1 then
                textarea:SetFontBold(true)
                checkbox:SetText("Bold")
            else
                textarea:SetFontBold(false)
                checkbox:SetText("Normal")
            end
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
