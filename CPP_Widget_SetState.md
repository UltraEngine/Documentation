# Widget::SetState #
This method sets the widget state. The widget state may be WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE.

## Syntax ##
- void **SetState**(const WidgetState state)
- void **SetState**(const bool selected)

| Parameter | Description |
|---|---|
| state | widget state to set |
| selected | if true the state will be WIDGETSTATE_SELECTED, otherwise it will be WIDGETSTATE_UNSELECTED |
