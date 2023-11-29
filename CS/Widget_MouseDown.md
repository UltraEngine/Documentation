# Widget.MouseDown

This method is called when the mouse cursor enters the active window bounds.

## Syntax

```csharp
protected virtual void MouseDown(MouseButton button, int x, int y)
```

## Parameters

| Parameter | Description |
|---|---|
| button | mouse button pressed, can be `MouseButton.MOUSE_LEFT`, `MouseButton.MOUSE_RIGHT`, or `MouseButton.MOUSE_MIDDLE` |
| x | mouse x screen coordinate |
| y | mouse y screen coordinate  |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.