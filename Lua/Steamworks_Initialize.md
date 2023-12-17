# Initialize

Namespace: [Steamworks](Steamworks.md)

This function initializes the Steamworks API. It should be called at the start of any Steam application.

## Syntax

- boolean **Initialize**()

## Returns

Returns true if Steamworks is successfully initialized, otherwise false is returned.

```lua
-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Get and print Steam information
Print("App ID: " .. tostring(Steamworks.GetAppId()))
Print("Build ID: " .. tostring(Steamworks.GetBuildId()))

-- Get user information
local userId = Steamworks.GetUserId()
Print("User ID: " .. tostring(userId))
Print("User name: " .. Steamworks.GetUserName(userId))

-- Shutdown Steam
Steamworks.Shutdown()
```
