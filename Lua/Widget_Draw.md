# Widget:Draw

This function is called each time the widget is redrawn.

## Syntax

```lua
function Widget:Draw(x, y, width, height)
```

## Parameters

| Name  | Description                                      |
| ----- | ------------------------------------------------ |
| x     | x screen coordinate of the drawn area            |
| y     | y screen coordinate of the drawn area            |
| width | width of the drawn area                          |
| height| height of the drawn area                         |

## Remarks

This is a protected virtual method. It can only be used by defining it in a custom widget.