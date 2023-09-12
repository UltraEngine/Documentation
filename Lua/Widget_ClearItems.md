# Widget:ClearItems #
This method clears all widget items and redraws the widget.

## Syntax ##
- **ClearItems**()

## Example ##

```lua
-- Load plugins
local plugin_svg = LoadPlugin("Plugins/SVG.*")

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.root:GetSize()

-- Create filter input
local button = CreateButton("Clear Items", 20, 20, sz.x - 40, 30, ui.root)

-- Create list box
local listbox = CreateListBox(20, 55, sz.x - 40, sz.y - 75, ui.root)
listbox:AddItem("Item 1", true)
listbox:AddItem("Item 2")
listbox:AddItem("Item 3")
listbox:AddItem("Item 4")
listbox:AddItem("Item 5")
listbox:AddItem("Item 6")

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == button then
            listbox:ClearItems()
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```