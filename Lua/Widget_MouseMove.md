# Widget:MouseMove

This function is called whenever the mouse moves, with coordinates relative to the active window.

## Syntax

```lua
function Widget:MouseMove(x: number, y: number)
```

## Parameters

- `x` (number): mouse x screen coordinate
- `y` (number): mouse y screen coordinate

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.