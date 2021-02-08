# TreeView #
The tree view widget displays a nested list of items.

| Property | Type | Description |
| --- | --- | --- |
| TREEVIEW_MULTISELECT | enum | Allows multiple tree view nodes to be selected at once. |
| TREEVIEW_DRAGANDDROP | enum | Allows drag-and-drop operations. |
| TREEVIEW_SORT | enum | Automatically sorts all tree view nodes by alphatical order. |
| TREEVIEW_DRAGINSERT | enum | When combined with the DRAGANDDROP style, this allows nodes to be dropped in between other nodes. |
| root | shared_ptr<[TreeViewNode](CPP_TreeViewNode.md)>& | Root tree view node. |
| [SelectNode](CPP_TreeView_SelectNode.md) | Method | Selects a tree view node. |
| [CreateTreeView](CPP_CreateTreeView.md) | Function | Creates a new tree view widget. |
