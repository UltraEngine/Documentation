# Shutdown

Namespace: [Steamworks](Steamworks.md)

This function should be called when a Steam app exits.

## Syntax

- void **Shutdown**()

## Example

```lua
-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Print App ID, Build ID, User ID, and User name
Print("App ID: " .. String(Steamworks.GetAppId()))
Print("Build ID: " .. String(Steamworks.GetBuildId()))
local userId = Steamworks.GetUserId()
Print("User ID: " .. String(userId))
Print("User name: " .. Steamworks.GetUserName(userId))

-- Shutdown Steam
Steamworks.Shutdown()
```
