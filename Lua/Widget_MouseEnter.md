# Widget:MouseEnter

This method is called when the mouse cursor enters the active window bounds.

## Syntax

```lua
function Widget:MouseEnter(x: number, y: number): void
```

## Parameters

| Name | Type | Description |
| ---  | ---  | ---         |
| x    | number | mouse x screen coordinate |
| y    | number | mouse y screen coordinate |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.

```lua
-- Define a custom widget class
Widget = {}

function Widget:MouseEnter(x, y)
    -- Add your custom code here
end
```