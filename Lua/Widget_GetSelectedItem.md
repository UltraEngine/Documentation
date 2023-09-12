# Widget:GetSelectedItem #

For use with listbox and combobox widgets, this method gets the selected widget item.

---

## Syntax ##

- `widget:GetSelectedItem() -> number`

---

## Returns ##

Returns the selected widget item index, or -1 if no item is selected.

---

## Example ##
```lua
local ul = require("UltraEngine")

--Get the displays
local displays = ul.GetDisplays()

--Create a window
local window = ul.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

--Create User Interface
local ui = ul.CreateInterface(window)
local sz = ui.root:GetSize()

local label = ul.CreateLabel("Selected item: 0", 20, 20, sz.x, 30, ui.root)

local listbox = ul.CreateListBox(20, 50, sz.x - 40, sz.y - 70, ui.root)
listbox:AddItem("Item 1", true)
listbox:AddItem("Item 2")
listbox:AddItem("Item 3")
listbox:AddItem("Item 4")
listbox:AddItem("Item 5")
listbox:AddItem("Item 6")

while true do
    local ev = ul.WaitEvent()
    if ev.id == ul.EVENT_WINDOWCLOSE then
        return 0
    elseif ev.id == ul.EVENT_WIDGETSELECT then
        label:SetText("Selected item: " .. tostring(listbox:GetSelectedItem()))
    end
end
```