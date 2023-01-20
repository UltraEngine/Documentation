# Widget::SetItemState

This method sets the state of a single widget item.

## Syntax

- void **SetItemState**(const int index, const WidgetState state)
- void **SetItemState**(const int index, const bool state)

| Parameter | Description |
|---|---|
| index | item index to modify |
| state | can be WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE |

## Remarks

The boolean values true and false correspond to WIDGETSTATE_SELECTED and WIDGETSTATE_UNSELECTED, respectively.
