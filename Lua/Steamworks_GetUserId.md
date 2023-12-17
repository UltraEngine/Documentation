# GetUserId

Namespace: [Steamworks](Steamworks.md)

This function gets the user's Steam profile ID.

## Syntax

- number **GetUserId**()

## Returns

Returns the user ID.

```lua
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
