# CreateLobby

Namespace: [Steamworks](Steamworks.md)

This function creates a new lobby.

## Syntax

- number **CreateLobby**(number type = LOBBY_PUBLIC, number capacity = 16)

| Parameter | Description |
|---|---|
| type | can be LOBBY_PUBLIC, LOBBY_PRIVATE, or LOBBY_FRIENDSONLY |
| capacity | maximum number of players allowed |

## Returns

Returns a new lobby if successful, otherwise zero is returned.

## Remarks

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/multiplayer/matchmaking) for additional information.

## Example

```lua
-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

local gamename = "Universal Tailor"
local servername = "My Cool Server"

-- Create lobby properties
local properties = {}
properties["game"] = gamename

-- Create a lobby
local lobby = Steamworks.CreateLobby()
Print("Created lobby " .. String(lobby))
Steamworks.SetLobbyProperty(lobby, "game", gamename)
Steamworks.SetLobbyProperty(lobby, "name", servername)

-- Pause briefly before the lobby will be listed in search results
Sleep(1000)

-- Get lobbies based on properties
local lobbies = Steamworks.GetLobbies(properties)
Print(String(#lobbies) .. " lobbies found")
for n = 1, #lobbies do
    Print(tostring(n) .. ": " .. String(lobbies[n]))
    Print("Max players: " .. String(Steamworks.GetLobbyCapacity(lobbies[n])))
    Print("Name: " .. Steamworks.GetLobbyProperty(lobbies[n], "name"))
end

-- Shutdown Steam
Steamworks.Shutdown()
```
