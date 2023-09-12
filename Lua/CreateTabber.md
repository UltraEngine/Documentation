# CreateTabber

The tabber widget is a tabbed panel that allows the user to select different "pages" in a user interface.

## Syntax

```lua
--[[-
CreateTabber creates a tabber widget.

@tparam int x widget X position
@tparam int y widget Y position
@tparam int width widget width
@tparam int height widget height
@tparam Widget parent parent widget
@treturn shared_ptr<Widget> pointer to the created tabber widget
]]--
function CreateTabber(x, y, width, height, parent)
```

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTabber.png)

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.root:ClientSize()
local tabber = CreateTabber(10, 10, sz.x - 20, sz.y - 20, ui.root)
tabber:AddItem("Item 1", true)
tabber:AddItem("Item 2")
tabber:AddItem("Item 3")

local panels = {}
sz = tabber:ClientSize()
panels[1] = CreatePanel(0, 0, sz.x, sz.y, tabber)
panels[2] = CreatePanel(0, 0, sz.x, sz.y, tabber)
panels[3] = CreatePanel(0, 0, sz.x, sz.y, tabber)

panels[1]:SetColor(0.1, 0.15, 0.1, 1)
panels[2]:SetColor(0.1, 0.1, 0.15, 1)

panels[2]:SetHidden(true)
panels[3]:SetHidden(true)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETSELECT then
        if ev.source == tabber then
            for n = 1, #tabber.items do
                if n == ev.data then
                    panels[n]:SetHidden(false)
                else
                    panels[n]:SetHidden(true)
                end
            end
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```