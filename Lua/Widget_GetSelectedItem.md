# Widget:GetSelectedItem

For use with listbox and combobox widgets, this method gets the selected widget item.

## Syntax

- number **GetSelectedItem**()

## Returns

Returns the selected widget item index, or 0 if no item is selected.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:GetSize()

local label = CreateLabel("Selected item: 0", 20, 20, sz.x, 30, ui.background)

local listbox = CreateListBox(20, 50, sz.x - 40, sz.y - 70, ui.background)
listbox:AddItem("Item 1", true)
listbox:AddItem("Item 2")
listbox:AddItem("Item 3")
listbox:AddItem("Item 4")
listbox:AddItem("Item 5")
listbox:AddItem("Item 6")

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    elseif ev.id == EVENT_WIDGETSELECT then
        label:SetText("Selected item: " .. tostring(listbox:GetSelectedItem()))
    end
end
```
