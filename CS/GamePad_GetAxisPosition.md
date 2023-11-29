# GamePad.GetAxisPosition

This method gets the current position of a thumbstick or trigger.

## Syntax

```csharp
Vec2 GetAxisPosition(GamePadAxis axis)
```

| Parameter | Description |
|---|---|
| axis | gamepad axis, can be `GamePadAxis.RTrigger`, `GamePadAxis.LTrigger`, `GamePadAxis.RStick`, or `GamePadAxis.LStick` |

## Returns

Returns the gamepad axis position.

## Example

```csharp
Vec2 position = GamePad.GetAxisPosition(GamePadAxis.RTrigger);
```