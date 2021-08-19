# Widget::MouseUp

This method is called when a mouse button is released.

## Syntax

- void **MouseUp**(const MouseButton button, const int x, const int y)

| Parameter | Description |
|---|---|
| button | mouse button released, can be MOUSE_LEFT, MOUSE_RIGHT, or MOUSE_MIDDLE |
| x | mouse x screen coordinate |
| y | mouse y screen coordinate  |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.
