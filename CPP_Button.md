# Button #
The button widget can be used to create push buttons, checkboxes, radio buttons, and toolbar items. Buttons emit a WIDGETACTION event when pushed. Some styles use the widget state to indicate whether they are selected.

**Base Class:** [Widget](CPP_Widget.md)

| Property | Type | Description |
| --- | --- | --- |
| BUTTON_CANCEL | enum | Specifies a button that is activated by the escape key. |
| BUTTON_CHECKBOX | enum | Specifies a checkbox. |
| BUTTON_RADIO | enum | Specifies a radio button. |
| BUTTON_OK | enum | Specifies a button that is activated by the enter key. |
| BUTTON_TOGGLE | enum | Specifies a toggle button. |
| BUTTON_TOOLBAR | enum | Specifies a toolbar button. |
| [GetState](CPP_Widget_GetState.md) | Method | Gets the button state. |
| [SetState](CPP_Widget_SetState.md) | Method | Sets the button state. |
| [CreateButton](CPP_CreateButton.md) | Function | Creates a new Button widget. |
