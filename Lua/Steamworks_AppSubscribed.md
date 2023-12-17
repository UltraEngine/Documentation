# AppSubscribed

Namespace: [Steamworks](Steamworks.md)

This function checks to see if an application is authorized for usage by the user.

## Syntax

- boolean **AppSubscribed**(number appid)

| Parameter | Description |
|---|---|
| appid | the Steam app ID to check |

## Returns

Returns true if the specified application can be run by the user. This usually means the application is owned by the user, but will also return true if the app is being loaned or is free to play for a temporary period.

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/auth) for additional information about autnentication and ownership of games.

## Example

```c++
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
