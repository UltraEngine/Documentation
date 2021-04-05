# Widget::SetParent

This method makes this widget a child of the specified parent widget.

## Syntax

- void **SetParent**(shared_ptr<[Widget](Widget.md)\> parent)
- void **SetParent**(shared_ptr<[Widget](Widget.md)\> parent, const int position)

| Parameter | Description |
| --- | --- |
| parent | new parent widget |
| position | the position in the parent child list to insert this widget |

## Remarks
If the position is not specified the widget will be added to the end of the parent's list of children.

The parent widget may be NULL if you are deleting the widget.

## Example

```c++

```
