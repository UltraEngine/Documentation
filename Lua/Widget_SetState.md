# Widget:SetState

This method sets the widget state. The widget state may be WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE.

## Syntax

- **SetState**(state: number)
- **SetState**(selected: boolean)

| Parameter | Description |
|---|---|
| state | widget state to set, either WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE |
| selected | if true the state will be WIDGETSTATE_SELECTED, otherwise it will be WIDGETSTATE_UNSELECTED |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[1])

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()
local button = CreateButton("Checkbox", sz.x / 2 - 40, sz.y / 2 - 15, 80, 30, ui.background, BUTTON_CHECKBOX)

-- Set the widget state
button:SetState(WIDGETSTATE_INDETERMINATE)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
