# Widget.TripleClick

This method is called when a mouse button is clicked rapidly three times.

## Syntax

```csharp
protected virtual void TripleClick(MouseButton button, int x, int y)
```

| Parameter | Description |
|---|---|
| button | mouse button pressed, can be [MOUSE_LEFT](link), [MOUSE_RIGHT](link), or [MOUSE_MIDDLE](link) |
| x | mouse x screen coordinate |
| y | mouse y screen coordinate |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.

## Example

```csharp
protected override void TripleClick(MouseButton button, int x, int y)
{
    // Example implementation
    Console.WriteLine($"Triple click detected on {button} at ({x}, {y})!");
}
```