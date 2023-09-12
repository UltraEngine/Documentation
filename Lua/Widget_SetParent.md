# Widget:SetParent

This method makes this widget a child of the specified parent widget.

## Syntax

```lua
function Widget:SetParent(parent: Widget)
function Widget:SetParent(parent: Widget, position: number)
```

### Parameters

| Parameter | Description |
| --- | --- |
| parent | The new parent widget. |
| position | The position in the parent child list to insert this widget. |

## Remarks

If the position is not specified, the widget will be added to the end of the parent's list of children.

The parent widget may be nil if you are deleting the widget.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.root:ClientSize()

-- Panel
local panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.root)
panel:SetColor(0, 0, 0)
panel:SetLayout(1, 1, 1, 1)

-- Subpanel
sz = panel:ClientSize()
local subpanel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.root)
subpanel:SetColor(0.5, 0.5, 0.5)
subpanel:SetLayout(1, 1, 1, 1)

-- Parent the subpanel to the panel
subpanel:SetParent(panel)

while true do
    local ev = WaitEvent()
    
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```