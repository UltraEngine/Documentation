# Widget.MouseUp

This method is called when a mouse button is released.

## Syntax

```csharp
protected virtual void MouseUp(MouseButton button, int x, int y)
```

| Parameter | Description |
|---|---|
| button | mouse button released, can be [MOUSE_LEFT](link-to-api), [MOUSE_RIGHT](link-to-api), or [MOUSE_MIDDLE](link-to-api) |
| x | mouse x screen coordinate |
| y | mouse y screen coordinate  |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.