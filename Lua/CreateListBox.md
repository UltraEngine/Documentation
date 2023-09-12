## CreateListBox

The listbox widget displays a vertical list of items. The widget emits a WIDGETACTION event when an item is double-clicked, or when the enter key is pressed, with the item index stored in the event data member. The widget emits a WIDGETSELECT event when a new item is selected, with the item index stored in the event data member.

### Syntax

```lua
-- shared_ptr<Widget> CreateListBox(const int x, const int y, const int width, const int height, shared_ptr<Widget> parent)
```

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

### Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateListBox.png)

```lua
require("UltraEngine")

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
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
    if ev.id == EVENT_WIDGETACTION then
        print("Item " .. tostring(ev.data) .. " action")
    elseif ev.id == EVENT_WIDGETSELECT then
        print("Item " .. tostring(ev.data) .. " selected")
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```