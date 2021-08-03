# Widget::GetSelectedNodes

This method retrieves all the currently selected nodes in a treeview widget created with the MULTISELECT treeview style.

## Syntax

- vector<shared_ptr<[Widget](Widget.md)\> \> GetSelectedNodes()

## Returns

Returns a vector containing all of the selected treeview nodes.

## Example

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
    auto treeview = CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui->root, TREEVIEW_MULTISELECT);
    treeview->SetLayout(1, 1, 1, 1);

    auto node1 = treeview->root->AddNode("Node 1");
    auto node2 = treeview->root->AddNode("Node 2");
    auto node3 = treeview->root->AddNode("Node 3");

    while (true)
    {
        const auto& event = WaitEvent();
        switch (event.id)
        {
        case EVENT_WIDGETSELECT:
            if (event.source == treeview and event.data == 1)
            {
                auto treeview = event.source->As<Widget>();
                auto nodes = treeview->GetSelecteNodes();
                for (auto node : nodes)
                {
                    Print("Selected: " + node->text);
                }
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
