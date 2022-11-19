# GamePadAxisPosition

This function gets the current position of a thumbstick or trigger.

## Syntax

- [Vec2](Vec2.md) **GamePadAxisPosition**(const GamePadAxis axis, const int index = 0)

| Parameter | Description |
|---|---|
| axis | gamepad axis, can be GAMEPADAXIS_RTRIGGER, GAMEPADAXIS_LTRIGGER, GAMEPADAXIS_RSTICK, or GAMEPADAXIS_LSTICK |
| index | controller index, to support multiple gamepads |

## Returns

Returns the gamepad axis position.
