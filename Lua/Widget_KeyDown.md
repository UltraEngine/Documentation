# Widget:KeyDown

This function is called when a keyboard key is pressed.

## Syntax

```lua
function Widget:KeyDown(keycode)
```

## Parameters

| Parameter | Description |
|---|---|
| keycode | The key that was pressed. |

## Returns

If the function returns true, menu hotkeys will be overridden.

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.