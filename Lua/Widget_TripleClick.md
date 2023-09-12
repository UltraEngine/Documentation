# Widget:TripleClick

This function is called when a mouse button is clicked rapidly three times.

```
function Widget:TripleClick(button, x, y)
```

## Parameters

- **button** (number): the mouse button pressed, can be `MOUSE_LEFT`, `MOUSE_RIGHT`, or `MOUSE_MIDDLE`
- **x** (number): the mouse x screen coordinate
- **y** (number): the mouse y screen coordinate

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.