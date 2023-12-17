# GetLobbyMembers

Namespace: [Steamworks](Steamworks.md)

This function gets the members in the specified lobby.

## Syntax

- std::vector<uint64\> **GetLobbyMembers**(const uint64 lobby)

| Parameter | Description |
|---|---|
| lobby | lobby ID |

## Returns

Returns an array of user IDs if the user is in the same lobby, otherwise an array of zeros will be returned.

```lua
-- Assuming Steamworks module is loaded or provided by the UltraEngine

-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Get lobbies
local lobbies = Steamworks.GetLobbies()
Print(String(#lobbies) .. " lobbies found")

-- Iterate through lobbies and print information
for n = 1, #lobbies do
    Print(tostring(n) .. ": " .. String(lobbies[n]))
    Print("Name: " .. Steamworks.GetLobbyProperty(lobbies[n], "name"))
    Print("Max players: " .. String(Steamworks.GetLobbyCapacity(lobbies[n])))

    -- Get lobby members
    local members = Steamworks.GetLobbyMembers(lobbies[n])
    Print(String(#members) .. " members\n")
end

-- Shutdown Steam
Steamworks.Shutdown()
```
