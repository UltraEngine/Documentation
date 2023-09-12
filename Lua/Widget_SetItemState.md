# widget:SetItemState(index, state)

This method sets the state of a single widget item.

---
### Syntax

- `widget:SetItemState(index, state)`
- `widget:SetItemState(index, state)`

---
### Parameters

| Name | Description |
|---|---|
| index | item index to modify |
| state | can be `WIDGETSTATE_SELECTED`, `WIDGETSTATE_UNSELECTED`, or `WIDGETSTATE_INDETERMINATE` |

---
### Remarks

The boolean values `true` and `false` correspond to `WIDGETSTATE_SELECTED` and `WIDGETSTATE_UNSELECTED`, respectively.

---

## Example

```lua
widget:SetItemState(1, WIDGETSTATE_SELECTED)
```