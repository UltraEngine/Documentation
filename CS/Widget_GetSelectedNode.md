# Widget.GetSelectedNode

This method retrieves the currently selected node in a treeview widget.

## Syntax

- Widget GetSelectedNode()

## Returns

Returns the selected treeview node, or null if none is selected.

## Example

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], UltraEngine.WINDOW_TITLEBAR | UltraEngine.WINDOW_RESIZABLE);

        //Create User Interface
        var ui = UltraEngine.CreateInterface(window);

        //Create widget
        var sz = ui.root.ClientSize();
        var treeview = UltraEngine.CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui.root, UltraEngine.TREEVIEW_DRAGANDDROP | UltraEngine.TREEVIEW_DRAGINSERT);
        treeview.SetLayout(1, 1, 1, 1);

        var node1 = treeview.root.AddNode("Node 1");
        var node2 = treeview.root.AddNode("Node 2");
        var node3 = treeview.root.AddNode("Node 3");

        while (true)
        {
            var event = UltraEngine.WaitEvent();
            switch (event.id)
            {
                case UltraEngine.EVENT_WIDGETSELECT:
                    if (event.source == treeview && event.data == 1)
                    {
                        var treeview = event.source as Widget;
                        var node = treeview.GetSelectedNode();
                        Console.WriteLine("Selected: " + node.text);
                    }
                    break;
                case UltraEngine.EVENT_WIDGETACTION:
                    if (event.source == treeview)
                    {
                        var node = event.extra as Widget;
                        Console.WriteLine("Action: " + node.text);
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
                case UltraEngine.EVENT_WIDGETDROP:
                    var child = event.source as Widget;
                    var parent = event.extra as Widget;
                    child.SetParent(parent, event.data);
                    break;
                case UltraEngine.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```