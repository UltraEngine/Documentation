# CreateTabber

The tabber widget is a tabbed panel that allows the user to select different "pages" in a user interface.

## Syntax

- [Widget](Widget.md) **CreateTabber**(number x, number y, number width, number height, [Widget](Widget.md) parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTabber.png)

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.background:ClientSize()
local tabber = CreateTabber(10, 10, sz.x - 20, sz.y - 20, ui.background)
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
