# Window:setCursor

This method sets the window cursor.

## Syntax

```lua
window:setCursor(cursor)
```

### Parameters

- `cursor` : MouseCursor
  - The mouse icon to set. Can be any of the values in the list below.

## Remarks

The cursor can be any of the values below:

- `CURSOR_NONE`
- `CURSOR_DEFAULT`
- `CURSOR_HAND`
- `CURSOR_CROSS`
- `CURSOR_IBEAM`
- `CURSOR_SIZENS`
- `CURSOR_SIZEWE`
- `CURSOR_SIZENESW`
- `CURSOR_SIZENWSE`
- `CURSOR_SIZEALL`
- `CURSOR_DRAG`
- `CURSOR_DRAGADD`
- `CURSOR_NO`

Use `CURSOR_NONE` to hide the mouse pointer.