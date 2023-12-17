# GetLobbyProperty

Namespace: [Steamworks](Steamworks.md)

This function gets a lobby property value for a given key.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **GetLobbyProperty**(number lobby, [string](https://www.lua.org/manual/5.4/manual.html#6.4) key)

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

local gamename = "Universal Tailor"
local servername = "My Cool Server"

-- Create lobby properties
local properties = {}
properties["game"] = gamename

-- Create a lobby
local lobby = Steamworks.CreateLobby()
Print("Created lobby " .. tostring(lobby))
Steamworks.SetLobbyProperty(lobby, "game", gamename)
Steamworks.SetLobbyProperty(lobby, "name", servername)

-- Pause briefly before the lobby will be listed in search results
Sleep(1000)

-- Get lobbies based on properties
local lobbies = Steamworks.GetLobbies(properties)
Print(tostring(#lobbies) .. " lobbies found")
for n = 1, #lobbies do
    Print(tostring(n) .. ": " .. tostring(lobbies[n]))
    Print("Max players: " .. tostring(Steamworks.GetLobbyCapacity(lobbies[n])))
    Print("Name: " .. Steamworks.GetLobbyProperty(lobbies[n], "name"))
end

-- Shutdown Steam
Steamworks.Shutdown()
```
