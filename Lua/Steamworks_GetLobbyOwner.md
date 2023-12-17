# GetLobbyOwner

Namespace: [Steamworks](Steamworks.md)

This function retrieves the lobby's owner.

## Syntax

- number **GetLobbyOwner**(number lobby)

| Parameter | Description |
|---|---|
| lobby | lobby ID |

## Returns

Returns the user ID of the lobby's owner if the user is in the lobby, otherwise zero is returned.

## Remarks

If the owner of a lobby leaves, ownership will be transfered to another user and a LOBBYDATACHANGED event will be emitted.

```lua
-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Create a lobby
local lobby = Steamworks.CreateLobby()

-- Get the owner of the lobby
local owner = Steamworks.GetLobbyOwner(lobby)

-- Print lobby and owner information
Print("Lobby: " .. tostring(lobby))
Print("Owner: " .. Steamworks.GetUserName(owner))

-- Shutdown Steam
Steamworks.Shutdown()
```
