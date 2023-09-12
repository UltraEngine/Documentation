# widget:GetState

This method retrieves the widget state.

## Syntax

```lua
function widget:GetState()
```

## Returns

Returns the widget state. This may be WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE.

## Example

```lua
local displays = GetDisplays()

local window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[1])

local ui = CreateInterface(window)
local sz = ui.root:ClientSize()
local button = CreateButton("Unselected", sz.x / 2 - 40, sz.y / 2 - 15, 120, 30, ui.root, BUTTON_CHECKBOX)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == button then
            if button:GetState() == WIDGETSTATE_SELECTED then
                button:SetText("Selected")
            else
                button:SetText("Unselected")
            end
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```