# GetAppId

Namespace: [Steamworks](Steamworks.md)

This functions retrieves the app ID for this game.

## Syntax

- number **GetAppId**()

## Returns

Returns the game's Steam app ID.

```lua
-- Assuming Steamworks module is loaded or provided by the UltraEngine

-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Get and print Steam information
Print("App ID: " .. String(Steamworks.GetAppId()))
Print("Build ID: " .. String(Steamworks.GetBuildId()))

-- Get user information
local userId = Steamworks.GetUserId()
Print("User ID: " .. String(userId))
Print("User name: " .. Steamworks.GetUserName(userId))

-- Shutdown Steam
Steamworks.Shutdown()
```
