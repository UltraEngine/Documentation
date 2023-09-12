# Widget:DoubleClick

This function is called when a mouse button is clicked twice in rapid succession.

## Syntax

```lua
function Widget:DoubleClick(button, x, y)
```

### Parameters

| Parameter | Description |
|---|---|
| button | The mouse button that was clicked. Can be `MOUSE_LEFT`, `MOUSE_RIGHT`, or `MOUSE_MIDDLE`. |
| x | The mouse X position when clicked. |
| y | The mouse Y position when clicked. |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.