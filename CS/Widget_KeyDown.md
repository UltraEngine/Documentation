# Widget.KeyDown

This method is called when a keyboard key is pressed.

```csharp
protected virtual bool KeyDown(KeyCode key)
```

| Parameter | Description |
|---|---|
| key | the key that was pressed |

## Returns

If the method returns true, menu hotkeys will be overridden.

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.