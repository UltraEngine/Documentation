# Shutdown

Namespace: [Steamworks](Steamworks.md)

This function should be called when a Steam app exits.

## Syntax

- **Shutdown**()

## Example

```lua
-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Print App ID, Build ID, User ID, and User name
Print("App ID: " .. tostring(Steamworks.GetAppId()))
Print("Build ID: " .. tostring(Steamworks.GetBuildId()))
local userId = Steamworks.GetUserId()
Print("User ID: " .. tostring(userId))
Print("User name: " .. Steamworks.GetUserName(userId))

-- Shutdown Steam
Steamworks.Shutdown()
```
