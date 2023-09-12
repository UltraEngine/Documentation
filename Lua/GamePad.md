# GamePad

Base class: [Object](Object.md)

The GamePad class provides built-in support for XBox One and XBox 360 game controllers on Windows.

## Property

### ButtonDown()

**Type:** Method

**Description:** Gets the button press state.

### ButtonHit()

**Type:** Method

**Description:** Gets the button hit state.

### GetAxisPosition()

**Type:** Method

**Description:** Gets the axis position.

### GetConnected()

**Type:** Method

**Description:** Returns true as long as the gamepad is connected.

### Flush()

**Type:** Method

**Description:** Resets the gamepad button hit states.

### Rumble()

**Type:** Method

**Description:** Controls haptic feedback.

## Function

### GetGamePads()

**Description:** Gets a list of connected gamepads.

## Example

```lua
-- Get a list of connected gamepads
local gamepads = GetGamePads()

-- Iterate through the list of gamepads
for i, gamepad in ipairs(gamepads) do
    -- Check if the gamepad is connected
    if gamepad:GetConnected() then
        -- Get the button press state
        local buttonDown = gamepad:ButtonDown()

        -- Get the button hit state
        local buttonHit = gamepad:ButtonHit()

        -- Get the axis position
        local axisPosition = gamepad:GetAxisPosition()

        -- Reset the gamepad button hit states
        gamepad:Flush()

        -- Control the haptic feedback
        gamepad:Rumble()
    end
end
```