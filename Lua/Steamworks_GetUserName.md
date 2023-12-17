# GetUserName

This function retrieves the display name for the specified user ID.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **GetUserName**(number userid)

| Parameter | Description |
|---|---|
| userid | user ID to return the name of |

## Returns 

Returns the user's display name.

## Example

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
