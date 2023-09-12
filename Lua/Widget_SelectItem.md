# Widget:SelectItem #

For use with listbox and combobox widgets, this function selects a widget item.

## Syntax ##

```lua
-- Selects a widget item
-- @param index the widget item index, in the range from zero to the number of items minus one, or -1 to deselect all items
-- @return none
function Widget:SelectItem(index)
```

| Parameter | Description |
|-----------|-------------|
| index     | widget item index, in the range from zero to the number of items minus one, or -1 to deselect all items |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
local sz = ui.root:GetSize()
local listbox = CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui.root)

-- Add items
for n = 0, 9 do
    listbox:AddItem("Item " .. tostring(n))
end

-- Select an item
listbox:SelectItem(3)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```