# Widget::AddNode

This method adds a node to a treeview widget.

## Syntax

- shared_ptr<[Widget](Widget.md)\> AddNode(const [WString](WString.md)& text, shared_ptr<[Icon](Icon.md)> icon = NULL)

| Parameter | Description |
|---|---|
| text | treeview node text |
| icon | treeview node icon |

## Returns

Returns a new treeview node if called by a treeview widget, otherwise NULL is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->ClientSize();
    auto treeview = CreateTreeView(10, 10, sz.x - 20, sz.y - 20, ui->root);

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
        const auto& event = WaitEvent();
        switch (event.id)
        {
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
