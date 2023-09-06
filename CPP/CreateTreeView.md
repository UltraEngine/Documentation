# CreateTreeView

The treeview widget displays a hierarchy of nodes that can be selected, opened and closed, double-clicked, and moved. The [Widget::AddNode](Widget_AddNode.md) method is used to add nodes to the tree hierarchy.

When a new node is selected the WIDGETSELECT event will be emitted, with the treeview node stored in the event extra member. When a node is double-clicked, a WIDGETACTION event will be emitted, with the treeview node stored in the event extra member.

If the DRAGANDDROP style is used, the widget will emit a WIDGETDROP event when a node is dragged onto another node, with the source node as the event source and the destination node stored in the event extra member. If the DRAGINSERT style is also used, the event data member will be set to 0 when the node is dropped onto another node, -1 when it is dropped above it, and 1 when it is dropped below it.

If the MULTISELECT style is used, the user can select multiple nodes in the tree at once by holding using the control or shift keys when clicking.

The SORT style can be used to automatically sort treeview nodes alphabetically.

## Syntax

- shared_ptr<[Widget](Widget.md)\> **CreateTreeView**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const TreeViewStyle style = TREEVIEW_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | treeview style, can be any combination of TREEVIEW_MULTISELECT, TREEVIEW_DRAGANDDROP, TREEVIEW_SORT, and TREEVIEW_DRAGINSERT |

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTreeView.png)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->ClientSize();
    auto treeview = CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui->root, TREEVIEW_DRAGANDDROP | TREEVIEW_DRAGINSERT);
    treeview->SetLayout(1, 1, 1, 1);

    auto node = treeview->root->AddNode("Node 1");
    node->AddNode("Subnode 1");
    node->AddNode("Subnode 2");
    node->AddNode("Subnode 3");

    node = treeview->root->AddNode("Node 2");
    node->AddNode("Subnode 1");
    node->AddNode("Subnode 2");
    node->AddNode("Subnode 3");

    node = treeview->root->AddNode("Node 3");
    node->AddNode("Subnode 1");
    node->AddNode("Subnode 2");
    node->AddNode("Subnode 3");

    while (true)
    {
        const auto event = WaitEvent();
        switch (event.id)
        {
        case EVENT_WIDGETSELECT:
            if (event.source == treeview and event.data == 1)
            {
                node = event.extra->As<Widget>();
                Print("Selected: " + node->text);
            }
            break;
        case EVENT_WIDGETACTION:
            if (event.source == treeview)
            {
                node = event.extra->As<Widget>();
                Print("Action: " + node->text);
                if (!node->kids.empty())
                {
                    if (node->Collapsed())
                    {
                        node->Expand();
                    }
                    else
                    {
                        node->Collapse();
                    }
                }
            }
            break;
        case EVENT_WIDGETDROP:
            {
                auto child = event.source->As<Widget>();
                auto parent = event.extra->As<Widget>();
                child->SetParent(parent, event.data);
            }
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
