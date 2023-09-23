# Widget:AddNode

This method adds a node to a treeview widget.

## Syntax

- [Widget](Widget.md) AddNode([string](https://www.lua.org/manual/5.4/manual.html#6.4) text, [Icon](Icon.md) icon = nil)

| Parameter | Description |
|---|---|
| text | treeview node text |
| icon | treeview node icon |

## Returns

Returns a new treeview node if called by a treeview widget, otherwise NULL is returned.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.background:ClientSize()
local treeview = CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui.background)

local node = treeview.root:AddNode("Node 1")
node:AddNode("Subnode 1")
node:AddNode("Subnode 2")
node:AddNode("Subnode 3")

node = treeview.root:AddNode("Node 2")
node:AddNode("Subnode 1")
node:AddNode("Subnode 2")
node:AddNode("Subnode 3")

node = treeview.root:AddNode("Node 3")
node:AddNode("Subnode 1")
node:AddNode("Subnode 2")
node:AddNode("Subnode 3")

while true do
    local event = WaitEvent()
    if event.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
