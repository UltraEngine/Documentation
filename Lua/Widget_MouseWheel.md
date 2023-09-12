# `Widget.MouseWheel`

This function is called when the mouse wheel turns.

## Syntax

```lua
function Widget:MouseWheel(delta, x, y)
```

### Parameters

- `delta` (number): how much it turned since last call
- `x` (number): mouse x screen coordinate
- `y` (number): mouse y screen coordinate

## Remarks

This method is a protected virtual method. It can only be used by declaring it in a custom widget.

## Example

```lua
-- CustomWidget.lua

CustomWidget = {}

function CustomWidget:MouseWheel(delta, x, y)
    -- code to handle mouse wheel event according to delta, x, and y
end
```