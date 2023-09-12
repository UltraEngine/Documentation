# GamePad.GetAxisPosition

This function gets the current position of a thumbstick or trigger.

## Syntax

```lua
function GamePad.GetAxisPosition(axis: GamePadAxis) -> Vec2
```

### Parameters

- `axis` (type: [GamePadAxis](#gamepadaxis)): gamepad axis, can be `GAMEPADAXIS_RTRIGGER`, `GAMEPADAXIS_LTRIGGER`, `GAMEPADAXIS_RSTICK`, or `GAMEPADAXIS_LSTICK`.

### Returns

- Returns the gamepad axis position (type: [Vec2](Vec2.md)).

## Example

```lua
local axis = GamePad.GetAxisPosition(GamePadAxis.GAMEPADAXIS_RSTICK)
print(axis.x, axis.y)
```