# GetGamePads

This function retrieves a list of available game pads.

## Syntax

```lua
function GetGamePads() --> table
```

## Returns

Returns the available game pads that are plugged in as a table.

## Example

```lua
local gamepads = GetGamePads()
for i, gamepad in ipairs(gamepads) do
    print("GamePad", i)
    print("Buttons:", gamepad.buttons)
    print("Axis:", gamepad.axis)
    print("IsConnected:", gamepad.isConnected)
    print()
end
```