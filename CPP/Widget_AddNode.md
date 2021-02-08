# Widget::AddNode #
This method adds a node to a treeview widget.

## Syntax ##
- shared_ptr<[Widget](Widget.md)\> AddNode(const [WString](WString.md)& text, shared_ptr<[Icon](Icon.md)> icon = NULL)

| Parameter | Description |
|---|---|
| text | treeview node text |
| icon | treeview node icon |

# Returns #
Returns a new treeview node if called by a treeview widget, otherwise NULL is returned.
