# Widget::MouseDown

This method is called when the mouse cursor enters the active window bounds.

## Syntax

- void **MouseDown**(const MouseButton button, const int x, const int y)


| Parameter | Description |
|---|---|
| button | mouse button pressed, can be MOUSE_LEFT, MOUSE_RIGHT, or MOUSE_MIDDLE |
| x | mouse x screen coordinate |
| y | mouse y screen coordinate  |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.
