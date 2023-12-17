# GetLobbyCapacity

Namespace: [Steamworks](Steamworks.md)

This function gets the maximum number of players allowed in the lobby

## Syntax

- int **GetLobbyCapacity**(const uint64 lobby)

| Parameter | Description |
|---|---|
| lobby | lobby ID |

## Returns

Returns the maximum number of players allowed in the lobby.

## Example

```lua
-- Assuming Steamworks module is loaded or provided by the UltraEngine

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
