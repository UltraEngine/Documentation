# Widget.SelectNode

This method sets the selection state of a tree view node.

## Syntax

```csharp
void SelectNode(Widget node, bool selected = true)
```

| Parameter | Description |
| --- | --- |
| node | node to set the selection state for |
| selected | true to select the node or false to deselect it |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Widget.GetDisplays();

        //Create a window
        var window = Widget.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_RESIZABLE);

        //Create User Interface
        var ui = Widget.CreateInterface(window);

        //Create widget
        var sz = ui.root.ClientSize();
        var treeview = Widget.CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui.root, TreeViewFlags.TREEVIEW_DRAGANDDROP | TreeViewFlags.TREEVIEW_DRAGINSERT);
        treeview.SetLayout(1, 1, 1, 1);

        var node1 = treeview.root.AddNode("Node 1");
        var node2 = treeview.root.AddNode("Node 2");
        var node3 = treeview.root.AddNode("Node 3");

        treeview.SelectNode(node1);

        while (true)
        {
            var event = Widget.WaitEvent();
            switch (event.id)
            {
                case WidgetEvent.EVENT_WIDGETSELECT:
                    if (event.source == treeview && event.data == 1)
                    {
                        node = event.extra.As<Widget>();
                        Console.WriteLine("Selected: " + node.text);
                    }
                    break;
                case WidgetEvent.EVENT_WIDGETACTION:
                    if (event.source == treeview)
                    {
                        node = event.extra.As<Widget>();
                        Console.WriteLine("Action: " + node.text);
                        if (!node.kids.empty())
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
                case WidgetEvent.EVENT_WIDGETDROP:
                {
                    var child = event.source.As<Widget>();
                    var parent = event.extra.As<Widget>();
                    child.SetParent(parent, event.data);
                }
                break;
                case WidgetEvent.EVENT_WINDOWCLOSE:
                    return;
                    break;
            }
        }
    }
}
```