# GetSelectedNode

This function retrieves the currently selected node in a treeview widget.

## Syntax

- [Widget](Widget.md) **GetSelectedNode**()

## Returns

Returns the selected treeview node, or nil if none is selected.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.background:ClientSize()
local treeview = CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui.background, TREEVIEW_DRAGANDDROP | TREEVIEW_DRAGINSERT)
treeview:SetLayout(1, 1, 1, 1)

local node1 = treeview.root:AddNode("Node 1")
local node2 = treeview.root:AddNode("Node 2")
local node3 = treeview.root:AddNode("Node 3")

while true do
    local event = WaitEvent()
    if event.id == EVENT_WIDGETSELECT and event.source == treeview and event.data == 1 then
        local node = treeview:GetSelectedNode()
        Print("Selected: " .. node.text)
    elseif event.id == EVENT_WIDGETACTION and event.source == treeview then
        local node = Widget(event.extra)
        Print("Action: " .. node.text)
        if #node.kids > 0 then
            if node:Collapsed() then
                node:Expand()
            else
                node:Collapse()
            end
        end
    elseif event.id == EVENT_WIDGETDROP then
        local child = Widget(event.source)
        local parent = Widget(event.extra)
        child:SetParent(parent, event.data)
    elseif event.id == EVENT_WINDOWCLOSE then
        return
    end
end
```
