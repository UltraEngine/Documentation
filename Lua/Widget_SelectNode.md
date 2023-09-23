# Widget:SelectNode

This method sets the selection state of a tree view node.

## Syntax

- **SelectNode**([Widfet](Widget.md) node, boolean selected = true)

| Parameter | Description |
|---|---|
| node | node to set the selection state for |
| selected | true to the select the node |

## Example

```lua
local displays = GetDisplays()

window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

ui = CreateInterface(window)

sz = ui.background:ClientSize()
treeview = CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui.background, TREEVIEW_DRAGANDDROP | TREEVIEW_DRAGINSERT)
treeview:SetLayout(1, 1, 1, 1)

node1 = treeview.root:AddNode("Node 1")
node2 = treeview.root:AddNode("Node 2")
node3 = treeview.root:AddNode("Node 3")

treeview:SelectNode(node1)

while true do
    event = WaitEvent()
    if event.id == EVENT_WIDGETSELECT then
        if event.source == treeview and event.data == 1 then
            node = Widget(event.extra)
            Print("Selected: " .. node.text)
        end
    elseif event.id == EVENT_WIDGETACTION then
        if event.source == treeview then
            node = Widget(event.extra)
            Print("Action: " .. node.text)
            if #node.kids > 0 then
                if node:Collapsed() then
                    node:Expand()
                else
                    node:Collapse()
                end
            end
        end
    elseif event.id == EVENT_WIDGETDROP then
        child = Widget(event.source)
        parent = Widget(event.extra)
        child:SetParent(parent, event.data)
    elseif event.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
