# GetLobbies

Namespace: [Steamworks](Steamworks.md)

This function is used to fetch a list of lobbies. These can be displayed in the game interface as servers the user can select from.

## Syntax

std::vector<uint64\> **GetLobbies**([table](table)& properties)

| Parameter | Description |
|---|---|
| properties | key/value pairs to match |

## Returns

Returns an array of lobbies that match the specified properties.

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
