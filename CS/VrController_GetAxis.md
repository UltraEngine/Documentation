# VrController.GetAxis

This method gets the current axis position of the controller.

## Syntax

```csharp
public Vec2 GetAxis(VrAxis axis)
```

| Parameter | Description |
|---|---|
| axis | axis to detect, can be VRAXIS_TRIGGER, VRAXIS_TOUCHPAD, VRAXIS_GRIP, or any number from 0 to 5 |

## Returns

Returns the current position for the specified axis.

## Example

```csharp
Vec2 axisPosition = VrController.GetAxis(VrAxis.VRAXIS_TOUCHPAD);
```