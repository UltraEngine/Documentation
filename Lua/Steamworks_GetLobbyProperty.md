# GetLobbyProperty

Namespace: [Steamworks](Steamworks.md)

This function gets a lobby property value for a given key.

## Syntax

- [WString](WString.md) **GetLobbyProperty**(const uint64 lobby, const [WString](WString.md)& key)

| Parameter | Description |
|---|---|
| lobby | the lobby ID |
| key | the name of the value to retrieve |

## Example

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
Print("Lobby: " .. String(lobby))
Print("Owner: " .. Steamworks.GetUserName(owner))

-- Shutdown Steam
Steamworks.Shutdown()
```
