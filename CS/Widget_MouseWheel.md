# Widget.MouseWheel

This method is called when the mouse wheel turns.

## Syntax

```csharp
protected virtual void MouseWheel(int delta, int x, int y)
```

| Parameter | Description |
| --- | --- |
| delta | how much it turned since last call |
| x | mouse x screen coordinate |
| y | mouse y screen coordinate |

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.