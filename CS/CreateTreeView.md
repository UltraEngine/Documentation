# CreateTreeView

The treeview widget displays a hierarchy of nodes that can be selected, opened and closed, double-clicked, and moved. The [Widget::AddNode](Widget_AddNode.md) method is used to add nodes to the tree hierarchy.

When a new node is selected the `WIDGETSELECT` event will be emitted, with the treeview node stored in the event extra member. When a node is double-clicked, a `WIDGETACTION` event will be emitted, with the treeview node stored in the event extra member.

If the `DRAGANDDROP` style is used, the widget will emit a `WIDGETDROP` event when a node is dragged onto another node, with the source node as the event source and the destination node stored in the event extra member. If the `DRAGINSERT` style is also used, the event data member will be set to 0 when the node is dropped onto another node, -1 when it is dropped above it, and 1 when it is dropped below it.

If the `MULTISELECT` style is used, the user can select multiple nodes in the tree at once by holding using the control or shift keys when clicking.

The `SORT` style can be used to automatically sort treeview nodes alphabetically.

## Syntax

- `TreeView CreateTreeView`(int x, int y, int width, int height, `Widget` parent, `TreeViewStyle` style = `TreeViewStyle.TREEVIEW_DEFAULT`)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | treeview style, can be any combination of `TreeViewStyle.TREEVIEW_MULTISELECT`, `TreeViewStyle.TREEVIEW_DRAGANDDROP`, `TreeViewStyle.TREEVIEW_SORT`, and `TreeViewStyle.TREEVIEW_DRAGINSERT` |

## Example

![CreateTreeView](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTreeView.png)

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0], WindowStyle.WINDOW_TITLEBAR | WindowStyle.WINDOW_RESIZABLE);

        //Create User Interface
        var ui = Interface.Create(window);

        //Create widget
        var sz = ui.root.ClientSize();
        var treeview = TreeView.Create(10, 10, sz.x - 20, sz.y - 20, ui.root, TreeViewStyle.TREEVIEW_DRAGANDDROP | TreeViewStyle.TREEVIEW_DRAGINSERT);
        treeview.SetLayout(1, 1, 1, 1);

        var node = treeview.root.AddNode("Node 1");
        node.AddNode("Subnode 1");
        node.AddNode("Subnode 2");
        node.AddNode("Subnode 3");

        node = treeview.root.AddNode("Node 2");
        node.AddNode("Subnode 1");
        node.AddNode("Subnode 2");
        node.AddNode("Subnode 3");

        node = treeview.root.AddNode("Node 3");
        node.AddNode("Subnode 1");
        node.AddNode("Subnode 2");
        node.AddNode("Subnode 3");

        while (true)
        {
            var event = WaitEvent();
            switch (event.id)
            {
                case Event.EVENT_WIDGETSELECT:
                    if (event.source == treeview && event.data == 1)
                    {
                        node = event.extra as Widget;
                        Print("Selected: " + node.text);
                    }
                    break;
                case Event.EVENT_WIDGETACTION:
                    if (event.source == treeview)
                    {
                        node = event.extra as Widget;
                        Print("Action: " + node.text);
                        if (node.kids.Count > 0)
                        {
                            if (node.Collapsed())
                            {
                                node.Expand();
                            }
                            else
                            {
                                node.Collapse();
                            }
                        }
                    }
                    break;
                case Event.EVENT_WIDGETDROP:
                    {
                        var child = event.source as Widget;
                        var parent = event.extra as Widget;
                        child.SetParent(parent, event.data);
                    }
                    break;
                case Event.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```