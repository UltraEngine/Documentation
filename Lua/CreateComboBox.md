# CreateComboBox #

The combobox widget displays a drop-down box the user can select an item from. This widget emits a WIDGETSELECT event when a new item is selected.

## Syntax ##
```lua
-- CreateComboBox - create a combobox widget
-- Parameters:
--   x - widget X position
--   y - widget Y position
--   width - widget width
--   height - widget height
--   parent - parent widget
-- Returns:
--   widget - the created combobox widget
function CreateComboBox(x, y, width, height, parent)
```

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example ##

![Example](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateComboBox.png)

```lua
-- Import required libraries
--import ...

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[0])

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
local sz = ui.root:ClientSize()
local combobox = CreateComboBox((sz.x - 300) / 2, (sz.y - 30) / 2, 300, 30, ui.root)
for n = 0, 20 do
    combobox:AddItem("Item " .. tostring(n), n == 0)
end

-- Event loop
while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETSELECT then
        print("Item " .. tostring(ev.data) .. " selected")
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```