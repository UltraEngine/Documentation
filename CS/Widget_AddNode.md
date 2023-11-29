# Widget.AddNode

This method adds a node to a treeview widget.

## Syntax

- Widget AddNode(string text, [Icon](Icon.md) icon = null)

| Parameter | Description |
|---|---|
| text | treeview node text |
| icon | treeview node icon |

## Returns

Returns a new treeview node if called by a treeview widget, otherwise null is returned.

## Example

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
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = Interface.Create(window);

        //Create widget
        var sz = ui.Root.ClientSize();
        var treeview = TreeView.Create(10, 10, sz.x - 20, sz.y - 20, ui.Root);

        var node = treeview.Root.AddNode("Node 1");
        node.AddNode("Subnode 1");
        node.AddNode("Subnode 2");
        node.AddNode("Subnode 3");

        node = treeview.Root.AddNode("Node 2");
        node.AddNode("Subnode 1");
        node.AddNode("Subnode 2");
        node.AddNode("Subnode 3");

        node = treeview.Root.AddNode("Node 3");
        node.AddNode("Subnode 1");
        node.AddNode("Subnode 2");
        node.AddNode("Subnode 3");

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventId.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```