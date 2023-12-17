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

```c++
#include "UltraEngine.h"
#include "Steamworks/Steamworks.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    // Initialize Steam
    if (not Steamworks::Initialize())
    {
        RuntimeError("Steamworks failed to initialize.");
        return 1;
    }

    auto lobbies = Steamworks::GetLobbies();
    Print(String(lobbies.size()) + " lobbies found");
    for (int n = 0; n < lobbies.size(); ++n)
    {
        Print(String(n) + ": " + String(lobbies[n]));
        Print("Name: " + Steamworks::GetLobbyProperty(lobbies[n], "name"));
        Print("Max players: " + String(Steamworks::GetLobbyCapacity(lobbies[n])));
        auto members = Steamworks::GetLobbyMembers(lobbies[n]);
        Print(String(members.size()) + " members\n");
    }

    Steamworks::Shutdown();
    return 0;
}
```
