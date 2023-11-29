# Widget.SetItemState

This method sets the state of a single widget item.

## Syntax

- void **SetItemState**(int index, WidgetState state)
- void **SetItemState**(int index, bool state)

| Parameter | Description |
|---|---|
| index | item index to modify |
| state | can be `WidgetState.Selected`, `WidgetState.Unselected`, or `WidgetState.Indeterminate` |

## Remarks

The boolean values `true` and `false` correspond to `WidgetState.Selected` and `WidgetState.Unselected`, respectively.