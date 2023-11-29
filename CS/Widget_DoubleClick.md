# Widget.DoubleClick

This method is called when a mouse button is clicked twice in rapid succession.

## Syntax

```csharp
protected virtual void DoubleClick(MouseButton button, int x, int y)
```

| Parameter | Description |
|---|---|
| button | which mouse button that was clicked, can be [MOUSE_LEFT](link), [MOUSE_RIGHT](link), or [MOUSE_MIDDLE](link) |
| x  | mouse x position when clicked |
| y  | mouse y position when clicked |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.

## Example

```csharp
protected override void DoubleClick(MouseButton button, int x, int y)
{
    // Handle the double click event
}
```