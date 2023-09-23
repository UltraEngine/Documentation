# Widget:RemoveItem

This method removes the item at the specified index.

## Syntax

- **RemoveItem**(number index)

## Parameters

| Parameter | Description |
|---|---|
| item | item index to remove, in the range from one to the number of items |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
local sz = ui.background:GetSize()
local listbox = CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui.background)

-- Add items
for n = 1, 10 do
    listbox:AddItem("Item " .. tostring(n), n == 0)
end

-- Remove an item
listbox:RemoveItem(3)

while true do
    local ev = WaitEvent()

    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
