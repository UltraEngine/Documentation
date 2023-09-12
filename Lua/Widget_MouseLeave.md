## Widget:MouseLeave

This method is called when the mouse cursor leaves the active window bounds.

### Syntax

```lua
function Widget:MouseLeave(x, y)
```

### Parameters

| Parameter | Description |
|-----------|-------------|
| x         | mouse x screen coordinate |
| y         | mouse y screen coordinate |

### Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.

Example:

```lua
-- Define a custom Widget class
Widget = {
  x = 0,
  y = 0,
  width = 100,
  height = 100
}

function Widget:MouseLeave(x, y)
  print("Mouse left the window at coordinates (" .. x .. ", " .. y .. ")")
end

-- Create an instance of the custom widget
local myWidget = Widget

-- Call the MouseLeave method
myWidget:MouseLeave(50, 30)
```