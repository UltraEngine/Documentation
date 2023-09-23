# Widget:GetItemText

This method returns the text of the specified widget item.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **GetItemText**(number item)

| Parameter | Description |
| --- | --- |
| item | widget item index |

## Returns

Returns the widget item text at the specified index.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.background:GetSize()

local label = CreateLabel("Selected item: \"Item 1\"", 20, 20, sz.x, 30, ui.background)

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
        local item = listbox:GetSelectedItem()
        label:SetText("Selected item: \"" .. listbox:GetItemText(item) .. "\"")
    end
end
```
