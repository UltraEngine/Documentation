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
