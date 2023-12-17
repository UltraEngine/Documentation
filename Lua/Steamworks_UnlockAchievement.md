# UnlockAchievement

Namespace: [Steamworks](Steamworks.md)

This functions sets an achievement for a user's account for the game.

## Syntax

- boolean **UnlockAchievement**([string](https://www.lua.org/manual/5.4/manual.html#6.4) name)

| Parameter | Description |
|---|---|
| name | name of the achievement set in the Steamworks game settings |

## Returns

Returns true if the achievement was successfully added. If the achievement does not exist or could not be set then false is returned.

## Remarks

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/achievements/ach_guide) for more information on creating achievements for your game.

## Example

```lua
-- Initialize Steamworks
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return 1
end

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280 * displays[1].scale, 720 * displays[1].scale, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()

-- Create camera
local camera = CreateCamera(world)

-- Main loop
while not window:KeyDown(KEY_ESCAPE) and not window:Closed() do
    -- Press A to win!
    if window:KeyHit(KEY_A) then
        Steamworks.UnlockAchievement("ACH_TRAVEL_FAR_SINGLE")
    end

    -- Update world
    world:Update()

    -- Update Steamworks
    Steamworks.Update()

    -- Render world
    world:Render(framebuffer)
end

-- Close Steamworks
Steamworks.Shutdown()
```
