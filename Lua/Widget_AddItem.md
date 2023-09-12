# ui.AddItem #
This function adds an item to any widget that displays a list of items.

## Syntax ##
- **ui.AddItem**(text: string, selected: boolean = false): number

### Parameters ###
- **text:** The text of the widget item.
- **selected:** Optional. If set to true, the item will be selected.

## Returns ##
Returns the index of the new widget item.

## Example ##
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

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```