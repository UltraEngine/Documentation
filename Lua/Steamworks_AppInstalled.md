# AppInstalled

Namespace: [Steamworks](Steamworks.md)

This function checks to see if an application is installed.

## Syntax

- boolean **AppInstalled**(number appid)

| Parameter | Description |
|---|---|
| appid | the Steam app ID to check |

## Returns

Returns true if the specified application is installed and ready to run, otherwise false is returned.

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/auth) for additional information about autnentication and ownership of games.

## Example

```lua
-- Initialize Steamworks
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return 1
end

-- Get the App ID
local appId = Steamworks.GetAppId()

-- Check if the app is subscribed
Print("App subscribed: " .. tostring(Steamworks.AppSubscribed(appId)))

-- Check if the app is installed
Print("App installed: " .. tostring(Steamworks.AppInstalled(appId)))

-- Shutdown Steamworks
Steamworks.Shutdown()
```
