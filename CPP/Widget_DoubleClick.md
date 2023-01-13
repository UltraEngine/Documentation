# Widget::DoubleClick

This method is called when a mouse button is clicked twice in rapid succession.

## Syntax

- void **DoubleClick**(const MouseButton button, const int x, const int y)

| Parameter | Description |
|---|---|
| button | which mouse button that was clicked, can be MOUSE_LEFT, MOUSE_RIGHT, or MOUSE_MIDDLE |
| x  | mouse x position when clicked |
| y  | mouse y position when clicked |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.
