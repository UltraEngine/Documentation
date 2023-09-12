# Widget:SetItemText
This method sets a widget item's text and redraws the widget.

## Syntax
```lua
function Widget:SetItemText(item, text)
```

### Parameters
- `item` (number): widget item index
- `text` (string): text to set

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.root:GetSize()
local listbox = CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui.root)
listbox:AddItem("Item 1", true)
listbox:AddItem("Item 2")
listbox:AddItem("Item 3")
listbox:AddItem("Item 4")
listbox:AddItem("Item 5")
listbox:AddItem("Item 6")

--Modify the item text
listbox:SetItemText(0, "This is the first item")

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```