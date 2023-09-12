# Widget:GetText

This method returns the widget text.

## Syntax

```lua
function Widget:GetText()
```

## Returns

Returns the widget text.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
local sz = ui.root:ClientSize()
local textfield = CreateTextField(20, 20, 300, 32, ui.root)
textfield:SetText("Here is some text!")

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == textfield then
            Print(textfield:GetText())
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
return 0
```