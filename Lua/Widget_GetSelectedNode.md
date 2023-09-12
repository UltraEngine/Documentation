# GetSelectedNode

This function retrieves the currently selected node in a treeview widget.

## Syntax

```lua
function GetSelectedNode() -> <userdata>
```

## Returns

Returns the selected treeview node, or `nil` if none is selected.

## Example

```lua
--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, GetDisplays()[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.root:ClientSize()
local treeview = CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui.root, TREEVIEW_DRAGANDDROP | TREEVIEW_DRAGINSERT)
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
        local node = event.extra:As<Widget>()
        Print("Action: " .. node.text)
        if #node.kids > 0 then
            if node:Collapsed() then
                node:Expand()
            else
                node:Collapse()
            end
        end
    elseif event.id == EVENT_WIDGETDROP then
        local child = event.source:As<Widget>()
        local parent = event.extra:As<Widget>()
        child:SetParent(parent, event.data)
    elseif event.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
Note: The example assumes that the required libraries are already imported to Lua and the `GetDisplays` and `CreateInterface` functions are available. Also, `GetDisplays()[1]` is used to get the first display.